require "rake"

namespace :osx do
  namespace :install do
    desc "Install applications from Brewfile"
    task :brewfile do
      file_dir = File.join(File.expand_path(File.dirname(__FILE__)), "..", "..")
      system %Q(cd #{file_dir}; brew bundle), out: STDOUT, err: :out
    end
  end

  task default: [:"install:brewfile"]
end

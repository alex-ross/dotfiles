require 'rake'

desc "Symlink files into user's home directory"
task :symlink do
  replace_all = false
  files = Dir["*"]
  files.reject! { |file| files_to_ignore.include?(file) }

  files.each do |file|
    next link_file(file) unless File.exist?(File.join(ENV["HOME"], ".#{file}"))
    next replace_file(file) if replace_all

    print "Overwrite '~/.#{file}'? [ynaq]"
    case $stdin.gets.chomp
    when "a"
      replace_all = true
      replace_file(file)
    when "y"
      replace_file(file)
    when "q"
      exit
    else
      puts "Skipping '~/.#{file}'"
    end
  end
end

namespace :tmp do
  desc "Creates directory '~/.tmp/' unless it exists"
  task :create do
    system %Q{mkdir -p ~/.tmp}
  end
end

namespace :bin do
  desc "Makes all files in '~/.bin/' executable"
  task :executable do
    system('chmod -R u+x bin')
  end
end

task default: [:symlink, :"tmp:create", :"bin:executable"]

def replace_file(file)
  system %Q{rm "$HOME/.#{file}"}
  link_file(file)
end

def link_file(file)
  puts "linking ~/.#{file}"
  system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
end

def files_to_ignore
  %w(
    Rakefile
    Brewfile
    ctags
    README
    LICENSE
    id_dsa.pub
    id_rsa.pub
  )
end

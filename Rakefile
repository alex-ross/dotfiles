require 'rake'

desc "install the dot files into user's home directory"
task :install do
  replace_all = false
  Dir['*'].each do |file|
    next if %w[Rakefile README LICENSE id_dsa.pub id_rsa.pub].include? file

    if File.exist?(File.join(ENV['HOME'], ".#{file}"))
      if replace_all
        replace_file(file)
      else
        print "overwrite ~/.#{file}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(file)
        when 'y'
          replace_file(file)
        when 'q'
          exit
        else
          puts "skipping ~/.#{file}"
        end
      end
    else
      link_file(file)
    end
  end

  # Handle ssh pubkey on its own
  puts "Linking public ssh key"
  %w(id_dsa.pub id_rsa.pub).each do |file|
    File.exist?(file) or next
    print "Link ssh key #{file}? [yn] "
    $stdin.gets.chomp == 'y' and link_public_ssh_key(file)
  end

  # Need to do this to make vim use RVM's ruby version
  if File.exist?('/etc/zshenv')
    puts "Moving zshenv to zshrc"
    system %Q{sudo mv /etc/zshenv /etc/zshrc}
  end

  system %Q{mkdir -p ~/.tmp}
end

def replace_file(file)
  system %Q{rm "$HOME/.#{file}"}
  link_file(file)
end

def link_file(file)
  puts "linking ~/.#{file}"
  system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
end

def link_public_ssh_key(file)
  puts "linking ~/.ssh/#{file}"
  system %Q{rm "$HOME/.ssh/#{file}"}
  system %Q{ln -s "$PWD/#{file}" "$HOME/.ssh/#{file}"}
end

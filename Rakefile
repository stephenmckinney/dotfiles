require 'rake'
require 'erb'

desc "install dotfiles into user's home directory"
task :install, [:server] do |t, args|
  puts "======================================================"
  puts "Installing symlinks."
  puts "======================================================"

  @erb_data = {:server => args.server}

  # Things NOT TO symlink on OS X
  default_blacklist = %w[bash_aliases.erb default-gems Rakefile README.md LICENSE iterm2]
  # The ONLY things to symnlink on Linux server account
  server_whitelist  = %w[bash_aliases.erb editrc inputrc irbrc]

  Dir['*'].each do |file|
    next if !args.server && default_blacklist.include?(file)
    next if args.server  && !server_whitelist.include?(file)

    symlink = if file == "default-gems"
                File.join(ENV['RBENV_ROOT'], "#{file.sub('.erb', '')}")
              else
                File.join(ENV['HOME'], ".#{file.sub('.erb', '')}")
              end

    install_file(file, symlink)
  end
  puts

  install_prezto unless args.server

  success_msg("installed")
end

desc "Update Tmuxifier"
task :update_tmuxifier do
  Dir.chdir(File.join(ENV['HOME'], '.tmuxifier')) do
    system %Q{git pull origin master}
    puts "Tmuxifier updated."
  end
end

desc "Import iTerm2 settings into dotfiles"
task :import_iterm do
  iterm_settings = File.join(ENV['HOME'], 'Library', 'Preferences', 'com.googlecode.iterm2.plist')
  system %Q{cp #{iterm_settings} ./iterm2/.}
end

def install_file(file, symlink)
  if File.exist? symlink
    if File.identical? file, symlink
      puts "identical #{symlink}"
    else
      print "overwrite #{symlink}? [ynaq] "
      case $stdin.gets.chomp
      when 'y'
        replace_file(file, symlink)
      when 'q'
        exit
      else
        puts "skipping #{symlink}"
      end
    end
  else
    link_file(file, symlink)
  end
end

def replace_file(file, symlink)
  system %Q{rm -rf "#{symlink}"}
  link_file(file, symlink)
end

def link_file(file, symlink)
  if file =~ /.erb$/
    puts "generating #{symlink}"
    File.open(symlink, 'w') do |new_file|
      new_file.write ERB.new(File.read(file)).result(binding)
    end
  else
    puts "linking #{symlink}"
    system %Q{ln -s "$PWD/#{file}" "#{symlink}"}
  end
end

def install_prezto
  unless File.exist?(File.join(ENV['HOME'], '.zprezto'))
    puts "======================================================"
    puts "Installing Prezto"
    puts "======================================================"
    system("git clone --recursive git://github.com/stephenmckinney/prezto ~/.zprezto")
    system("cd ~/.zprezto")
    system("git checkout my-customizations-and-theme")
    system("chsh -s /bin/zsh")
    puts
  end
end

def success_msg(action)
  puts "======================================================"
  puts "Success!"
  puts "======================================================"
  puts
  puts ".dotfiles have been #{action}. Please restart your terminal."
end

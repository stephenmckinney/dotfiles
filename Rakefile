require 'rake'
require 'erb'

desc "install dotfiles into user's home directory"
task :install, [:server] do |t, args|
  msg 'Installing dotfiles...'

  # Set erb data
  @erb_data = {:server => args.server}
  # Things NOT TO symlink on OS X
  default_blacklist = %w[bash_aliases.erb config default-gems Brewfile Rakefile README.md LICENSE iterm2]
  # The ONLY things to symnlink on Linux server account
  server_whitelist  = %w[bash_aliases.erb editrc inputrc irbrc]

  # Create or replace symlinks
  Dir['*'].each do |file|
    next if !args.server && default_blacklist.include?(file)
    next if args.server  && !server_whitelist.include?(file)

    symlink = File.join(ENV['HOME'], ".#{file.sub('.erb', '')}")
    create_or_replace_symlink(file, symlink)
  end

  # Install other configs
  unless args.server
    install_karabiner
    install_prezto
  end

  msg 'Success!'
  puts 'dotfiles have been installed. Please restart your terminal.'
end

desc "Update Tmuxifier"
task :update_tmuxifier do
  msg 'Updating tmuxifier...'
  Dir.chdir(File.join(ENV['HOME'], '.tmuxifier')) do
    system %Q{git pull origin master}
    puts 'Tmuxifier updated.'
  end
  msg 'Success!'
end

desc "Re-import iTerm2 settings into dotfiles"
task :import_iterm do
  msg 'Importing iterm settings...'
  iterm_settings = File.join(ENV['HOME'], 'Library', 'Preferences', 'com.googlecode.iterm2.plist')
  system %Q{cp #{iterm_settings} ./iterm2/.}
  msg 'Success!'
end

def create_or_replace_symlink(file, symlink)
  if File.exist? symlink
    if File.identical? file, symlink
      puts "identical #{symlink}"
    else
      print "overwrite #{symlink}? [ynq] "
      case $stdin.gets.chomp
      when 'y'
        replace_symlink(file, symlink)
      when 'q'
        exit
      else
        puts "skipping #{symlink}"
      end
    end
  else
    create_symlink(file, symlink)
  end
end

def replace_symlink(file, symlink)
  system %Q{rm -rf "#{symlink}"}
  create_symlink(file, symlink)
end

def create_symlink(file, symlink)
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

# Manually install karabiner config dir,
# so we don't overwrite other files/dirs in ~/.config/
def install_karabiner
  msg 'Installing Karabiner config...'

  Dir['config/*'].each do |file|
    # config/karabiner/ -> ~/.config/karabiner
    base_dir = File.join(ENV['HOME'], '.config')
    symlink = File.join(base_dir, 'karabiner')
    dir = 'config/karabiner'

    system %Q{mkir -p #{base_dir}}
    create_or_replace_symlink(dir, symlink)
  end

  msg 'Done'
end

def install_prezto
  msg 'Installing Prezto...'

  unless File.exist?(File.join(ENV['HOME'], '.zprezto'))
    system('git clone --recursive git://github.com/stephenmckinney/prezto ~/.zprezto')
    system('cd ~/.zprezto')
    # TODO: do we still need this?
    # system('git checkout my-customizations-and-theme')
    system('chsh -s /bin/zsh')
  else
    msg 'Skipping...Prezto already installed'
  end

  msg 'Done'
end

def msg(message)
  puts '======================================================'
  puts message
  puts '======================================================'
  puts
end

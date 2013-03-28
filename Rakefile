require 'rake'
require 'erb'

desc "install dotfiles into user's home directory"
task :install, [:server] do |t, args|
  puts "======================================================"
  puts "Installing symlinks."
  puts "======================================================"

  @erb_data = {:server => args.server}

  replace_all = false
  Dir['*'].each do |file|
    if args.server
      next unless %w[bash_aliases.erb editrc gitconfig inputrc irbrc].include? file
    else
      next if %w[bash_aliases.erb Rakefile README.md LICENSE iterm2].include? file
    end

    if File.exist?(File.join(ENV['HOME'], ".#{file.sub('.erb', '')}"))
      if File.identical? file, File.join(ENV['HOME'], ".#{file.sub('.erb', '')}")
        puts "identical ~/.#{file.sub('.erb', '')}"
      elsif replace_all
        replace_file(file)
      else
        print "overwrite ~/.#{file.sub('.erb', '')}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(file)
        when 'y'
          replace_file(file)
        when 'q'
          exit
        else
          puts "skipping ~/.#{file.sub('.erb', '')}"
        end
      end
    else
      link_file(file)
    end
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

def replace_file(file)
  system %Q{rm -rf "$HOME/.#{file.sub('.erb', '')}"}
  link_file(file)
end

def link_file(file)
  if file =~ /.erb$/
    puts "generating ~/.#{file.sub('.erb', '')}"
    File.open(File.join(ENV['HOME'], ".#{file.sub('.erb', '')}"), 'w') do |new_file|
      new_file.write ERB.new(File.read(file)).result(binding)
    end
  else
    puts "linking ~/.#{file}"
    system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
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

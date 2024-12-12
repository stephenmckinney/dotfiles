#!/usr/bin/ruby

# gem install irb-theme-tokyonight
# gem install awesome_print
begin
  require "irb/theme/tokyonight/night" # Load the Tokyo Night theme
  require "awesome_print" # Awesome Print pretty prints Ruby objects in full color
  AwesomePrint.irb!
rescue LoadError => err
  warn "Couldn't load: #{err}"
end

# Configure irb
IRB.conf[:PROMPT_MODE] = :SIMPLE
IRB.conf[:AUTO_INDENT] = true
IRB.conf[:SAVE_HISTORY] = 10000
IRB.conf[:EVAL_HISTORY] = 10000
IRB.conf[:HISTORY_FILE] = "#{ENV["HOME"]}/.irb_history"

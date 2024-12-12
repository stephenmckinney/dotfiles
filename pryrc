# gem install pry pry-doc pry-nav awesome_print

# === Editor ===
Pry.editor = 'nvim'

# === History ===
Pry.config.history_file = "~/.irb_history"

begin
  require 'awesome_print'
  require "pry-toys"
rescue LoadError => err
  puts "gem not installed error: #{err}"
end

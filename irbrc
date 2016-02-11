#!/usr/bin/ruby

# begin
#   require 'pry'
#   Pry.start
#   exit
# rescue LoadError => e
#   warn "=> Unable to load pry...so let's load irb"

  # Load handy gems
  require 'irb/completion'
  require 'irb/ext/save-history'

  begin
    require 'awesome_print' # Awesome Print pretty prints Ruby objects in full color
    #AwesomePrint.irb!
  rescue LoadError => err
    warn "Couldn't load 'awesome_print': #{err}"
  end

  # Configure irb
  IRB.conf[:PROMPT_MODE]  = :SIMPLE
  IRB.conf[:AUTO_INDENT] = true
  IRB.conf[:SAVE_HISTORY] = 10000
  IRB.conf[:EVAL_HISTORY] = 10000
  IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"

  # Add introspection methods
  class Object
    def ls_methods
      case self.class
      when Class
        self.public_methods.sort - Object.public_methods
      when Module
        self.public_methods.sort - Module.public_methods
      else
        self.public_methods.sort - Object.new.public_methods
      end
    end
  end

  # Add Rails helpers
  # load File.dirname(__FILE__) + '/.railsrc'

# end

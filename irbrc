#!/usr/bin/ruby

# Use Pry everywhere (except if Bundler is around)
#if !defined?(::Bundler)
  #require 'rubygems' # ruby 1.8.7 compatible
  #require 'pry'
  #Pry.start
  #exit
#else
  # Load handy gems
  require 'rubygems' # ruby 1.8.7 compatible
  require 'irb/completion'
  require 'irb/ext/save-history'
  begin
    require 'awesome_print' # Awesome Print pretty prints Ruby objects in full color
    AwesomePrint.irb!
  rescue LoadError => err
    warn "Couldn't load 'awesome_print': #{err}"
  end

  # Configure irb
  IRB.conf[:PROMPT_MODE]  = :SIMPLE
  IRB.conf[:SAVE_HISTORY] = 10000
  IRB.conf[:EVAL_HISTORY] = 10000
  IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"

  # Add introspection method
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

  # Add Chorus-specific helpers
  if (ENV['RAILS_ENV'] || defined? Rails) && (ENV['PWD'].split('/').last == 'sbn')
    class Chorus
      class << self
        def sbn_network() Community.find_by_domain('sbnation.com') end
        def polygon_network() Community.find_by_domain('polygon.com') end
        def verge_network() Community.find_by_domain('theverge.com') end

        def sbn_community() Community.find_by_domain('sbnation.com') end
        def polygon_community() Community.find_by_domain('polygon.com') end
        def verge_community() Community.find_by_domain('theverge.com') end
      end
    end
  end
#end

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
  IRB.conf[:AUTO_INDENT] = true
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

  # Add Rails helpers
  if (ENV['RAILS_ENV'] || defined? Rails)
    class Object
      def change_log(stream)
        ActiveRecord::Base.connection.instance_variable_set :@logger, Logger.new(stream)
        # Shit didn't work for me on Rails 2.3
        #ActiveRecord::Base.logger = Logger.new(stream)
        #ActiveRecord::Base.clear_active_connections!
      end

      def show_log
        change_log(STDOUT)
      end

      def hide_log
        change_log(nil)
      end

      def show_session(session)
        Marshal.load(Base64.decode64(session))
      end

      def find_me
        User.find_by_username('stephenmckinney')
      end
    end
  end

  # Add Chorus-specific helpers
  if (ENV['RAILS_ENV'] || defined? Rails) && ENV['PWD'].split('/').last == 'sbn'
    class Object
      #def sbn_network() Community.find_by_domain('sbnation.com') end
      #def polygon_network() Community.find_by_domain('polygon.com') end
      #def verge_network() Community.find_by_domain('theverge.com') end

      def find_sbn() Community.find_by_domain('sbnation.com') end
      def find_polygon() Community.find_by_domain('polygon.com') end
      def find_verge() Community.find_by_domain('theverge.com') end
      def current_community() Community.find_by_domain('theverge.com') end
    end
  end
#end

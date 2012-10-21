#!/usr/bin/ruby

# Use Pry everywhere (except if Bundler is around)
if !defined?(::Bundler)
  require 'rubygems'
  require 'pry'
  Pry.start
  exit
else
  require 'irb/completion'
  require 'irb/ext/save-history'

  IRB.conf[:SAVE_HISTORY] = 1000
  IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"
  IRB.conf[:PROMPT_MODE] = :SIMPLE

  # === Awesome Print support ===
  # Awesome Print is a Ruby library that pretty prints Ruby objects
  # in full color exposing their internal structure with proper
  # indentation.
  begin
    require 'awesome_print'
    unless IRB.version.include?('DietRB')
      IRB::Irb.class_eval do
        def output_value
          ap @context.last_value
        end
      end
    else # MacRuby
      IRB.formatter = Class.new(IRB::Formatter) do
        def inspect_object(object)
          object.ai
        end
      end.new
    end
  rescue LoadError => err
    puts "'awesome_print' gem not installed"
  end
end

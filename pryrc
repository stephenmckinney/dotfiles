# Awesome Print is a Ruby library that pretty prints Ruby objects
# in full color exposing their internal structure with proper
# indentation.
begin
  require 'awesome_print'
  Pry.print = proc { |output, value| output.puts value.ai }
rescue LoadError => err
  puts "'awesome_print' gem not installed"
end

# Pry-nav Teaches Pry about step, next, and continue to create a simple debugger.
begin
  require 'pry-nav'
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
rescue LoadError => err
  puts "'pry-nav' gem not installed"
end

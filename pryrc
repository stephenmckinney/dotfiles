begin
  require 'awesome_print'
  Pry.print = proc { |output, value| output.puts value.ai }
rescue LoadError => err
  puts "awesome_print gem not installed :("
end


#main
require './lib/elevator.rb'

@elevator = Elevator.new 5, 0
puts 'Please enter the floor number and press enter. To stop please type stop and press enter'
thread = Thread.new do
  loop do
    s = gets.chomp
    puts "You entered " + s
    @elevator.request_floor(s)
    exit if s == 'stop'
  end
end

loop do

  @elevator.process_floor_list
  
end

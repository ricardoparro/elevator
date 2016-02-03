require 'minitest/spec'
require 'minitest/autorun'
require './lib/elevator.rb'
describe Elevator do

    before do
         @elevator = Elevator.new 
    end

    it "can change direction to up" do
        @elevator.change_direction(Direction::UP)
        assert_equal @elevator.current_direction, Direction::UP
    end
    it "can change direction to down" do
        @elevator.change_direction(Direction::DOWN)
        assert_equal @elevator.current_direction, Direction::DOWN 
    end
    it "can move to that floor" do
        @elevator.change_floor(2)
        assert_equal(@elevator.current_floor,2)
    end
    it "can maintain a list of floor numbers" do
    end
    it "can move through the floors"
    it "can reverse direction when reaches the top"
    
end

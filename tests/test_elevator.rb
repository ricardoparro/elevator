require 'minitest/spec'
require 'minitest/autorun'
require './lib/elevator.rb'
describe Elevator do

    before do
         @elevator = Elevator.new 
    end

    it "can change direction to up" do
        @elevator.change_direction("up")
        assert_match @elevator.current_direction, "up"
    end
    it "can change direction to down" do
        @elevator.change_direction("down")
        assert_match @elevator.current_direction, "down" 
    end
    it "can move to that floor" do
        @elevator.change_floor(2)
        assert_equal(@elevator.current_floor,2)
    end
    it "can maintain a list of floor numbers"
    it "can move through the floors"
    it "can maintain a list of floor numbers"
    it "can move through the floors"
    it "can reverse direction when reaches the top"
    
end

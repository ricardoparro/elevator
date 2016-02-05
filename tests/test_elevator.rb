require 'minitest/spec'
require 'minitest/autorun'
require './lib/elevator.rb'

describe Elevator do

    before do
      #for faster tests considered 0 of distance between floors
         @elevator = Elevator.new 11,0
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
        @elevator.move_to_floor(3)
        assert_equal(@elevator.current_floor,3)
    end

    it "can maintain a list of floor numbers" do
        @elevator.request_floor(2);
        @elevator.request_floor(3);
        @elevator.request_floor(4); 
        @elevator.request_floor(1);

        assert(@elevator.floor_list.count,3)
        assert_equal(@elevator.floor_list[0], 2)
        assert_equal(@elevator.floor_list[1], 3)
        assert_equal(@elevator.floor_list[2], 4)    
        assert_equal(@elevator.floor_list[3], 1)    
    end
 
    it "can move through the floors" do
      output_from_elevator =  Display::build_alert(Alert::PASSING_BY, 1) + Display::build_alert(Alert::ARRIVED_TO_FLOOR, 2) 
      assert_output(output_from_elevator) { @elevator.move_to_floor(2)} 
    end

    it "can reverse direction when reaches the top" do
      @elevator.move_to_floor(@elevator.number_of_floors)
      #if reached the top the final floor should be the 1st
      assert_equal( @elevator.current_floor,1)
    end    
end

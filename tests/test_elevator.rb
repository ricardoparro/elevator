require 'minitest/spec'
require 'minitest/autorun'
require './lib/elevator.rb'

describe Elevator do

  before do
    #for faster tests considered 0 of distance between floors
    @elevator = Elevator.new 11,0
  end

  it "can change direction" do
    @elevator.request_floor(2);
    @elevator.request_floor(3);
    @elevator.process_floor_list
    assert_equal(@elevator.current_direction, Direction::UP)
    @elevator.request_floor(2);
    @elevator.process_floor_list
    assert_equal(@elevator.current_direction, Direction::DOWN)
  end


  it "can move to that floor" do
    @elevator.request_floor(2)
    @elevator.process_floor_list 
    assert_equal(@elevator.current_floor,2)
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

  it "can process a list of floors by order" do
    @elevator.request_floor(2)
    @elevator.request_floor(3)
    @elevator.request_floor(4) 
    @elevator.request_floor(5)
    assert(@elevator.floor_list.count, 4)
    @elevator.process_floor_list
    assert(@elevator.floor_list.count, 0)
  end

  it "can move through the floors" do
    output_from_elevator =  Display::build_alert(Alert::PASSING_BY, 1) + Display::build_alert(Alert::ARRIVED_TO_FLOOR, 2)
    @elevator.request_floor(2)
    assert_output(output_from_elevator) { @elevator.process_floor_list} 
  end

  it "can reverse direction when reaches the top" do
    el= Elevator.new 4, 0
    el.request_floor(4)
    el.request_floor(1)
    el.process_floor_list
    assert(el.current_floor, 1)
  end    
end

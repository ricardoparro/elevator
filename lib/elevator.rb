class Elevator

  attr_accessor :current_direction, :current_floor, :floor_list, :number_of_floors

  def initialize(number_of_floors, distance_between_floors)
    @current_floor = 1
    @floor_list=[]
    @current_direction = Direction::STANDBY
    @number_of_floors = number_of_floors 
    @distance_between_floors = distance_between_floors
  end


  def request_floor(floor_number)
    if(floor_number.to_i > @number_of_floors)
      puts 'invalid floor number'
      return;
    end
    @floor_list.push(floor_number.to_i)
  end

  def process_floor_list
    while @floor_list.count > 0 do
      @floor_list.each do |f|
        move_to_floor(f)
        @floor_list.shift
      end
    end
  end

  private

  def start_elevator_engine(floor_number)
    while @current_floor != floor_number do

      puts Display::build_alert(Alert::PASSING_BY, @current_floor)
      sleep(@distance_between_floors)

      if floor_number > @current_floor
        @current_floor += 1
        @current_direction = Direction::UP
      else
        @current_floor -= 1
        @current_direction = Direction::DOWN
      end
      puts Display::build_alert(Alert::ARRIVED_TO_FLOOR, @current_floor) 
    end
    if(@floor_list.count == 0)
      current_direction = Direction::STANDBY
    end
  end

  def move_to_floor(floor_number)
    start_elevator_engine(floor_number)
  end

end

class Direction
  UP = 1
  DOWN = 2
  STANDBY = 3
  MAINTENANCE = 4
end

class Display
  def self.build_alert(alert, floor)
    return alert + " " + floor.to_s + "\n"
  end
end

class Alert
  PASSING_BY = "passing by floor"
  ARRIVED_TO_FLOOR = "arrived to floor"
end



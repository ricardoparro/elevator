class Elevator

    attr_accessor :current_direction, :current_floor, :floor_list, :number_of_floors
    
    def initialize(number_of_floors, distance_between_floors)
        @current_floor = 1
        @floor_list=[]
        @current_direction = Direction::STANDBY
        @number_of_floors = number_of_floors 
        @distance_between_floors = distance_between_floors
    end

    def change_direction(to_direction)
        @current_direction = to_direction
    end
    
    def request_floor(floor_number)
        @floor_list.push(floor_number)
    end
    
    def move_to_floor(floor_number)
       
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
     
      end
      puts Display::build_alert(Alert::ARRIVED_TO_FLOOR, @current_floor)
  
      if(@current_floor == @number_of_floors )
        move_to_floor(1)
      end
    end

    private
    
    def reach_top?
    
    end


end

class Direction
    UP = 1
    DOWN = 2
    STANDBY = 3
    MAINTENANCE = 4
end

class Alert
  PASSING_BY = "passing by floor"
  ARRIVED_TO_FLOOR = "arrived to floor"
end
class Display
  def self.build_alert(alert, floor)
    return alert + " " + floor.to_s + "\n"
  end
end

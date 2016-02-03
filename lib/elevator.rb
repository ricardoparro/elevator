class Elevator

    attr_accessor :current_direction, :current_floor, :floor_list
    def initialize
        @current_floor =t0
        @floor_list=[]
        @current_direction = Direction::STANDBY
    end
    
    def change_direction(to_direction)
        @current_direction = to_direction
    end
    
    def change_floor(floor_number)
        @current_floor = floor_number
        @floor_list.push(floor_number)
    end

end

class Direction
    UP = 1
    DOWN = 2
    STANDBY = 3
    MAINTENANCE = 4
end

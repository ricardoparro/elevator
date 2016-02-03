class Elevator

    attr_accessor :current_direction, :current_floor
    
    def change_direction(direction)
        @current_direction = direction
    end
    def change_floor(floor_number)
        @current_floor = floor_number
    end

end

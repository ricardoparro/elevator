class Elevator

    attr_accessor :current_direction, :current_floor, :floor_list
    def initialize
        @current_floor = 0
        @floor_list=[]
        @current_direction = Direction::STANDBY
    end

    def start_elevator_engine
      t1 = Thread.new(process_requests())
      t2 = Thread.new(receive_requests())
    end

    def process_requests
      loop do
      end
    end

    def receive_requests
    end

    def change_direction(to_direction)
        @current_direction = to_direction
    end
    
    def request_floor(floor_number)
        @floor_list.push(floor_number)
    end
    def move_to_floor(floor_number)

      if(floor_number > @current_floor)
        @current_direction = Direction::UP
      else
        @current_direction = Direction::DOWN
      end
      puts 'moving.....'
      #sleep(10)
      @current_floor = floor_number
      puts 'arrived to floor #{floor_number}'
    end

end

class Direction
    UP = 1
    DOWN = 2
    STANDBY = 3
    MAINTENANCE = 4
end

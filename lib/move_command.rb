require_relative './movements'

class MoveCommand
  def initialize(robot, table)
    @robot = robot
    @table = table
  end

  def execute
    if(@robot.placed?)
      move_robot_forward
    else
      "Sorry, robot not placed yet"
    end
  end

  def move_robot_forward
    new_position = Movements.move_forward(@robot.current_position)
    if @table.valid_position?(new_position)
      puts "Moving forward"
      @robot.current_position = new_position
    else
      puts  "Whoops! Can't move there..."
    end
  end

end
require_relative './movements'
require_relative './command'
require_relative 'error_reporter'

class MoveCommand < Command
  def initialize(robot, table)
    @robot = robot
    @table = table
  end

  def execute
    if(@robot.placed?)
      move_robot_forward
    else
      ErrorReporter.new("not_placed")
    end
  end

  def move_robot_forward
    new_position = Movements.move_forward(@robot.current_position)
    if @table.valid_position?(new_position)
      puts "Moving forward"
      @robot.current_position = new_position
    else
      ErrorReporter.new("invalid_move")
    end
  end

end
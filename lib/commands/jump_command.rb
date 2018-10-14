require_relative '../movements'
require_relative '../command'
require_relative '../error_reporter'

class JumpCommand < Command
  def initialize(robot, table)
    @robot = robot
    @table = table
  end

  def execute
    if(@robot.placed?)
      jump_forward
    else
      ErrorReporter.error(RoboError::NotPlaced.new)
    end
  end

  private

  def jump_forward
    new_position = Movements.move_forward(@robot.current_position)
    new_position = Movements.move_forward(new_position)
    if @table.valid_position?(new_position)
      puts 'Jumped forward'
      @robot.current_position = new_position
    else
      ErrorReporter.error(RoboError::InvalidMove.new)
    end
  end

end
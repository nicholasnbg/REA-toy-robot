class MoveCommand < Command
  def initialize(robot, table)
    @robot = robot
    @table = table
  end

  def execute
    if(@robot.placed?)
      move_robot_forward
    else
      ErrorReporter.error(RoboError::NotPlaced.new)
    end
  end

  private

  def move_robot_forward
    new_position = Movements.move_forward(@robot.current_position)
    if @table.valid_position?(new_position)
      puts 'Moving forward'
      @robot.current_position = new_position
    else
      ErrorReporter.error(RoboError::InvalidMove.new)
    end
  end

end
class LeftCommand < Command
  attr_reader :robot
  def initialize(robot)
    @robot = robot
  end

  def execute
    if @robot.placed?
      new_position = Movements.rotate_left(@robot.current_position)
      robot.current_position = new_position
      puts "Turning left, now facing #{@robot.current_position.facing}"
    else
      ErrorReporter.error(RoboError::NotPlaced.new)
    end
  end
end

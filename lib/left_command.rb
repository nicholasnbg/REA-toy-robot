require_relative './movements'

class LeftCommand
  attr_reader :robot
  def initialize(robot)
    @robot = robot
  end

  def execute
    if @robot.placed?
      robot.current_position = Movements.rotate_left(@robot.current_position)
      puts "Turning left, now facing #{@robot.current_position.facing}"
    else
      puts "Whoops, the robot hasn't been placed yet"
    end
  end
end
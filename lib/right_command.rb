require_relative './movements'
require_relative './command'

class RightCommand < Command
  attr_reader :robot
  def initialize(robot)
    @robot = robot
  end

  def execute
    if @robot.placed?
      robot.current_position = Movements.rotate_right(@robot.current_position)
      puts "Turning right, now facing #{@robot.current_position.facing}"
    else
      puts "Whoops, the robot hasn't been placed yet"
    end
  end
end
require_relative './movements'
require_relative './command'
require_relative './error_reporter'

class LeftCommand < Command
  attr_reader :robot
  def initialize(robot)
    @robot = robot
  end

  def execute
    if @robot.placed?
      robot.current_position = Movements.rotate_left(@robot.current_position)
      puts "Turning left, now facing #{@robot.current_position.facing}"
    else
      ErrorReporter.new("not_placed")
    end
  end
end
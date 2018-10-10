require_relative '../error_reporter'

class PlaceCommand
  attr_reader :robot, :table, :position
  def initialize(robot, table, position)
    @robot = robot
    @table = table
    @position = position
  end

  def execute
    has_args = !@position.x.nil? && !@position.y.nil? && !@position.facing.nil?

    if has_args
      if @table.valid_position?(@position)
        puts "Placed at #{@position.x}, #{@position.y}, facing #{@position.facing}"
        @robot.current_position = @position
      else
        ErrorReporter.error(RoboError::InvalidPosition.new)
      end
    else
      ErrorReporter.error(RoboError::InvalidPosition.new)
    end
  end
end
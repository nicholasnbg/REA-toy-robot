require_relative './error_reporter'

class PlaceCommand
  attr_reader :robot, :table, :position
  def initialize(robot, table, position)
    @robot = robot
    @table = table
    @position = position
  end

  def execute
    if !@position.facing.nil?
      if @table.valid_position?(@position)
        puts "Placed at #{@position.x}, #{@position.y}, facing #{@position.facing}"
        @robot.current_position = @position
      else
        ErrorReporter.new('invalid_position')
      end
    else
      ErrorReporter.new('invalid_facing')
    end
  end
end
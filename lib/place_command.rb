class PlaceCommand
  attr_reader :robot, :table, :position
  def initialize(robot, table, position)
    @robot = robot
    @table = table
    @position = position
  end

  def execute
    if @table.valid_position?(@position)
      puts "Placed at #{@position.x}, #{@position.y}, facing #{@position.facing}"
      @robot.current_position = @position
    else
      puts "Whoops, this is not a valid position"
    end
  end
end
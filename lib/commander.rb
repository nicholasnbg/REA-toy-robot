require_relative './parser'
require_relative './position'
require_relative './place_command'
require_relative './move_command'
require_relative './right_command'
require_relative './left_command'
require_relative './report_command'
require_relative './invalid_command'

class Commander
  def initialize(robot, table)
    @robot = robot
    @table = table
    @parser = Parser.new
  end

  def return_command(input)
    command_request = @parser.parse(input)
    retrieve_command(command_request)
  end

  def retrieve_command(command_request)
    command = command_request.command
    args = command_request.args

    case command
    when 'place'
      x = args[0].to_i
      y = args[1].to_i
      facing = args[2].to_sym

      position = Position.new(x, y, facing)

      PlaceCommand.new(@robot, @table, position)
    when 'move'
      MoveCommand.new(@robot, @table)
    when 'right'
      RightCommand.new(@robot)
    when 'left'
      LeftCommand.new(@robot)
    when 'report'
      ReportCommand.new(@robot)
    else
      InvalidCommand.new
    end
  end
end
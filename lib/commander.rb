require_relative './position'
require_relative './commands/place_command'
require_relative './commands/move_command'
require_relative './commands/right_command'
require_relative './commands/left_command'
require_relative './commands/report_command'
require_relative './commands/invalid_command'

class Commander
  def initialize(robot, table, parser)
    @robot = robot
    @table = table
    @parser = parser
  end

  def return_command(input)
    command_request = @parser.parse(input)
    retrieve_command(command_request)
  end

  private

  def retrieve_command(command_request)
    command = command_request.command
    args = command_request.args

    case command
    when 'place'
      valid_x_y = /[0-9]/.match(args[0]) &&  /[0-9]/.match(args[1])
      if args.length == 3 && valid_x_y
        x = args[0].to_i
        y = args[1].to_i
        facing = args[2].to_sym

        position = Position.new(x, y, facing)
      else
        position = Position.new(nil, nil, nil,)
      end

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

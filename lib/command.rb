class Command
  def initialize(robot, table = nil, position = nil)
    @robot = robot
    @table = table
    @position = position
  end

  def execute
    ErrorReporter.error(RoboError::MethodNotImplemented.new)
  end
end

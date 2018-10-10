require_relative '../command'
require_relative '../error_reporter'

class InvalidCommand < Command

  def initialize(robot = nil)
    super(robot)
  end

  def execute
    ErrorReporter.error(RoboError::InvalidCommand.new)
  end
end
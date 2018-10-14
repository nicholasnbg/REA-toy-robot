class ReportCommand < Command

  def initialize(robot)
    @robot = robot
  end

  def execute
    @robot.report
  end
end
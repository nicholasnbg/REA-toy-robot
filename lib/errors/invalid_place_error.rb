class RoboError::InvalidPlace< StandardError
  def initialize
    super('To place the robot use the syntax: "place x, y, facing"')
  end
end
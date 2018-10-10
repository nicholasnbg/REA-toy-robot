class RoboErrors::NotPlaced < StandardError
  def initialize
    super('Whoops, the robot has not been placed yet')
  end
end
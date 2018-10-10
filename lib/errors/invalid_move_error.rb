class RoboError::InvalidMove < StandardError
  def initialize
    super("Sorry, you can't move there")
  end
end
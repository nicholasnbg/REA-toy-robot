module RoboErrors
end

class RoboErrors::InvalidMove < StandardError
  def initialize
    super("Sorry, you can't move there")
  end
end
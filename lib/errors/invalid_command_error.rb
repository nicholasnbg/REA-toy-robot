class RoboError::InvalidCommand < StandardError
  def initialize
    super('Sorry, that is not a valid command')
  end
end
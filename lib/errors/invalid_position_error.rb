class RoboError::InvalidPosition < StandardError
  def initialize
    super('Sorry, that is an invalid position')
  end
end
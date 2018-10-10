class RoboError::InvalidFacing < StandardError
  def initialize
    super('Whoops, that direction is not valid')
  end
end
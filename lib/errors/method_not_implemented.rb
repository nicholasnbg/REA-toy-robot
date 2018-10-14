class RoboError::MethodNotImplemented < StandardError
  def initialize
    super('This method has not been implemented yet')
  end
end
class RoboError::NoTestFile < StandardError
  def initialize(test_file_name)
    super("#{test_file_name} File does not exist")
  end
end
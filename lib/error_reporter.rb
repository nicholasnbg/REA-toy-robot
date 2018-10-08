class ErrorReporter
  attr_reader :error_name, :error_message
  def initialize(error_type)
    @error_type = error_type
    @error_name
    @error_message

    set_error
    print_error
  end

  def set_error
    case @error_type
    when "not_placed"
      @error_name = "NotPlaced"
      @error_message = "Whoops, the robot has not been placed yet"
    when "invalid_command"
      @error_name = "InvalidCommand"
      @error_message = "Sorry, that is not a valid command"
    when "invalid_facing"
      @error_name = "InvalidFacing"
      @error_message = "Whoops, that direction is not valid"
    when "invalid_move"
      @error_name = "InvalidMove"
      @error_message = "Sorry, you can't move there"
    when "invalid_position"
      @error_name = "InvalidPosition"
      @error_message = "Sorry, that is an invalid position"
    when "no_test_file"
      @error_name = "NoTestFile"
      @error_message = "No such test file exists"
    else
      @error_name = "MiscError"
      @error_message = "Whoops, something went wrong"
    end
  end

  def print_error
    puts "Error: #{@error_name}"
    puts "Message: #{@error_message}"
  end
end

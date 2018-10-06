class ErrorReporter
  attr_reader :error_name, :error_message
  def initialize(error_type)
    @error_type = error_type
    @error_name
    @error_message

    set_error
  end

  def set_error
    case @error_type
    when "not_placed"
      @error_name = "NotPlaced"
      @error_message = "Whoops, the robot has not been placed yet"
    when "invalid_command"
      @error_name = "InvalidCommand"
      @error_message = "Sorry, that is not a valid command"
    when "invalid_move"
      @error_name = "InvalidMove"
      @error_message = "Sorry, you can't move there"
    when "invalid_position"
      @error_name = "InvalidPosition"
      @error_message = "Sorry, that is an invalid position"
    else
      @error_name = "MiscError"
      @error_message = "Whoops, something went wrong"
    end
  end
end
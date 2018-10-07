class CommandRequest
  attr_reader :command, :args
  def initialize(command, args = nil)
    @command = command
    @args = args
  end

  def ==(other)
    command == other.command && args == other.args
  end
end

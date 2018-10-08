class CommandRequest
  attr_reader :command, :args
  def initialize(command, args = nil)
    @command = command
    @args = args
  end
end

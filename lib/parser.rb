require_relative './command_request'

class Parser

  def initialize
    @command
    @args
  end

  def parse(input = '')
    input.to_s.downcase
    @args = input.split(' ')
    @command = @args.shift
    @args = @args.join('').split(',')

    if @args.length > 1
      unless /[0-9]/.match(@args[0]) &&  /[0-9]/.match(@args[1])
        @args[0] = nil
        @args[1] = nil
      end
    end

    CommandRequest.new(@command, @args)
  end
end
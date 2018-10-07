require_relative './command_request'

class Parser

  def initialize
    @command
    @args
  end

  def parse(input = '')
    @command = input.to_s.downcase.split(' ')[0]

    if input.to_s.split(' ').length > 1 && @command == 'place'
      @args = input.to_s.downcase.split(' ')[1..-1].join('').split(',')
      unless /[0-9]/.match(@args[0]) &&  /[0-9]/.match(@args[1])
        @args[0] = nil
        @args[1] = nil
      end
    end

    CommandRequest.new(@command, @args)
  end
end
require_relative './command_request'

class Parser

  def initialize
    @command
    @args
  end

  def parse(input = '')
    @command = input.to_s.downcase.split(' ')[0]

    if input.to_s.split(' ').length > 1
      @args = input.to_s.downcase.split(' ')[1..-1].join('').split(',')
    end

    CommandRequest.new(@command, @args)
  end
end
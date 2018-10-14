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

    CommandRequest.new(@command, @args)
  end
end
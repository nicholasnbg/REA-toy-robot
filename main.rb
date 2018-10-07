require_relative 'lib/robot'
require_relative 'lib/table'
require_relative 'lib/commander'
require_relative './dialogue'

robot = Robot.new
table = Table.new(5,5)
commander = Commander.new(robot, table)

Dialogue.intro_dialogue

loop do
  puts ''
  puts 'Command >> '
  puts ''

  input = gets

  if input.downcase.match(/^exit$/)
    puts 'Thanks for playing!'
  end

  break if input.downcase.match(/^exit$/)

  if input.downcase.match(/^help$/)
    Dialogue.help_dialogue
  else
    command = commander.return_command(input)
    command.execute
  end
end
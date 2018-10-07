require_relative 'lib/robot'
require_relative 'lib/table'
require_relative 'lib/commander'

robot = Robot.new
table = Table.new(5,5)
commander = Commander.new(robot, table)

loop do
  puts ''
  puts 'Command >> '
  puts ''

  input = gets

  if input.downcase.match(/^exit$/)
    puts 'Thanks for playing!'
  end

  break if input.downcase.match(/^exit$/)

  command = commander.return_command(input)
  command.execute
end
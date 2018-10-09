Dir[File.join(__dir__, 'lib', '**', '*.rb')].each { |file| require file }
require_relative './dialogue'

robot = Robot.new
table = Table.new(5,5)
parser = Parser.new
commander = Commander.new(robot, table, parser)
test_runner = TestFileRunner.new(commander, './tests/')

Dialogue.intro_dialogue

loop do
  puts ''
  puts 'Command >> '
  puts ''

  input = gets.downcase

  case input
  when /^exit$/
    puts 'Thanks for playing!'
    break
  when /^help$/
    Dialogue.help_dialogue
  when /\Atest/
    test_file = input.split[1]
    test_runner.run(test_file)
  else
    command = commander.return_command(input)
    command.execute
  end

end
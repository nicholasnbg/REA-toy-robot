require_relative 'lib/robot'
require_relative 'lib/table'
require_relative 'lib/commander'
require_relative './dialogue'
require_relative 'lib/error_reporter'

robot = Robot.new
table = Table.new(5,5)
commander = Commander.new(robot, table)

Dialogue.intro_dialogue

loop do
  puts ''
  puts 'Command >> '
  puts ''

  input = gets

  # ----------------Exit case-------------------#
  if input.downcase.match(/^exit$/)
    puts 'Thanks for playing!'
  end

  break if input.downcase.match(/^exit$/)

  # --------------Help Dialogue-----------------#
  if input.downcase.match(/^help$/)
    Dialogue.help_dialogue

  # -------------Test file runner---------------#
  elsif input.downcase.match(/\Atest/)
    filename = input.split(' ')[1]
    file = "./tests/#{filename}"

    if File.exist?(file)
      File.readlines(file).each do |line|
        if !line.match(/\A#/)
          command = commander.return_command(line)
          command.execute
        else
          puts line
        end
      end
    else
      ErrorReporter.new("no_test_file")
    end
  # --------------Run user input-----------------#
  else
    command = commander.return_command(input)
    command.execute
  end
end
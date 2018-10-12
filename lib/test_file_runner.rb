require_relative './error_reporter'

class TestFileRunner
  def initialize(commander, tests_dir)
    @commander = commander
    @test_dir = tests_dir
  end

  def run(test_file_name = nil)
    if test_file_name
      file = [@test_dir, test_file_name].join
      if File.exist?(file)
        execute_commands_from(file)
      else
        ErrorReporter.error(RoboError::NoTestFile.new(test_file_name))
      end
    else
      ErrorReporter.error(RoboError::NoTestFile.new(''))
    end
  end

  private

  def execute_commands_from(file)
    File.readlines(file).each do |line|
      if !line.match(/\A#/)
        command = @commander.return_command(line)
        command.execute
      else
        puts line
      end
    end
  end
end
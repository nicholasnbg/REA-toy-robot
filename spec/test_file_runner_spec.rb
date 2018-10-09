require 'spec_helper'

describe TestFileRunner do
  let(:test_dir) { './tests/' }
  let(:robot) { Robot.new }
  let(:table) { Table.new(5,5) }
  let(:parser) { Parser.new }
  let(:commander) { Commander.new(robot, table, parser) }
  let(:test_file_runner) { described_class.new(commander ,test_dir) }


end
require 'spec_helper'
require 'input_parser'
require 'command'
require 'create_image_command'
require 'clear_command'
require 'colour_command'
require 'vertical_segment_command'
require 'horizontal_segment_command'
require 'fill_command'
require 'show_command'
require 'terminate_command'
require 'replace_command'

describe 'input_parser' do
  before(:all) do
    @parser = Input_Parser.new
  end

  context 'with known and valid commands' do
    it 'should parse Create command' do
      commands = @parser.parse 'I 250 248'

      commands.length.should eql 1
      assert_valid_create commands.first
    end

    it 'should parse Clear command' do
      commands = @parser.parse <<INPUT
I 2 3
C
INPUT

      assert_length commands
      commands.last.should be_a Clear_Command
    end

    it 'should parse Colour command' do
      commands = @parser.parse <<INPUT
I 2 3
L 1 2 V
INPUT

      assert_length commands
      assert_valid_colour commands.last
    end

    it 'should parse Vertical Segment command' do
      commands = @parser.parse <<INPUT
I 2 3
V 1 1 2 B
INPUT

      assert_length commands
      assert_valid_vertical_segment commands.last
    end

    it 'should parse Horizontal Segment command' do
      commands = @parser.parse <<INPUT
I 3 3
H 1 2 1 B
INPUT

      assert_length commands
      assert_valid_horizontal_segment commands.last
    end

    it 'should parse Fill command' do
      commands = @parser.parse <<INPUT
I 3 3
F 1 1 B
INPUT

      assert_length commands
      assert_valid_fill commands.last
    end

    it 'should parse Show command' do
      commands = @parser.parse <<INPUT
I 2 3
S
INPUT

      assert_length commands
      commands.last.should be_a Show_Command
    end

    it 'should parse Terminate command' do
      commands = @parser.parse <<INPUT
I 2 3
X
INPUT

      assert_length commands
      commands.last.should be_a Terminate_Command
    end

    it 'should parse Replace command' do
      commands = @parser.parse <<INPUT
I 2 3
R O C
INPUT

      assert_length commands
      commands.last.should be_a Replace_Command
    end
  end

  context 'with unknown commands' do
    it 'should output if the input command is unknown' do
      capture_output_for_input('Unknown command').should eql 'Start of input is [Unknown command] but should be [I]'
    end
  end

  context 'with invalid commands' do
    context 'invalid Create command' do
      it 'should output if the input does not start with a Create command' do
        capture_output_for_input('C').should eql 'Start of input is [C] but should be [I]'
      end

      it 'should output if the input to the Create command is invalid' do
        capture_output_for_input('I V 6').should eql 'Invalid input: [I V 6]'
      end

      it 'should output if the number of columns passed to the Create command is too big' do
        capture_output_for_input('I 251 6').should eql 'Invalid input: [I 251 6]'
      end

      it 'should output if the number of rows passed to the Create command is too big' do
        capture_output_for_input('I 2 251').should eql 'Invalid input: [I 2 251]'
      end
    end

    context 'invalid Colour command' do
      it 'should output if the input to the Colour command is invalid' do
        input = <<INPUT
I 2 3
L 1 B V
INPUT
        capture_output_for_input(input).should eql 'Invalid input: [L 1 B V]'
      end

      it 'should output if the pixel passed to the Colour command does not exist' do
        input = <<INPUT
I 2 3
L 4 4 V
INPUT
        capture_output_for_input(input).should eql 'Invalid input: [L 4 4 V]'
      end
    end

    context 'invalid Vertical Segment command' do
      it 'should output if the input to the Vertical Segment command is invalid' do
        input = <<INPUT
I 2 3
V F 1 2 B
INPUT
        capture_output_for_input(input).should eql 'Invalid input: [V F 1 2 B]'
      end

      it 'should output if one of the pixels in the segment passed to the Vertical Segment command does not exist' do
        input = <<INPUT
I 2 3
V 1 4 2 B
INPUT
        capture_output_for_input(input).should eql 'Invalid input: [V 1 4 2 B]'
      end
    end

    context 'invalid Horizontal Segment command' do
      it 'should output if the input to the Horizontal Segment command is invalid' do
        input = <<INPUT
I 2 3
H F 1 2 B
INPUT
        capture_output_for_input(input).should eql 'Invalid input: [H F 1 2 B]'
      end

      it 'should handle invalid Horizontal Segment command where one of the pixels in the segment does not exist' do
        input = <<INPUT
I 2 3
H 1 4 2 B
INPUT
        capture_output_for_input(input).should eql 'Invalid input: [H 1 4 2 B]'
      end
    end

    context 'invalid Fill command' do
      it 'should output if the input to the Fill command is invalid' do
        input = <<INPUT
I 2 3
F G 2 B
INPUT
        capture_output_for_input(input).should eql 'Invalid input: [F G 2 B]'
      end

      it 'should output if the pixel passed to the Fill command does not exist' do
        input = <<INPUT
I 2 3
F 4 2 B
INPUT
        capture_output_for_input(input).should eql 'Invalid input: [F 4 2 B]'
      end
    end

    context 'should output if the input to the Replace command is invalid' do
      it 'should handle invalid Replace command' do
        input = <<INPUT
I 2 3
R 1 2
INPUT
        capture_output_for_input(input).should eql 'Invalid input: [R 1 2]'
      end
    end
  end

  def capture_output_for_input(input)
    capture_io { @parser.parse(input) }.join ''
  end

  def assert_length(commands)
    commands.length.should eql 2
    commands.first.should be_a Create_Image_Command
  end

  def assert_valid_create(command)
    command.should be_a Create_Image_Command
    command.row_length.should eql 250
    command.number_of_rows.should eql 248
  end

  def assert_valid_colour(command)
    command.should be_a Colour_Command
    command.x.should eql 1
    command.y.should eql 2
    command.colour.should eql 'V'
  end

  def assert_valid_vertical_segment(command)
    command.should be_a Vertical_Segment_Command
    command.column.should eql 1
    command.first_row.should eql 1
    command.last_row.should eql 2
    command.colour.should eql 'B'
  end

  def assert_valid_horizontal_segment(command)
    command.should be_a Horizontal_Segment_Command
    command.row.should eql 1
    command.first_column.should eql 1
    command.last_column.should eql 2
    command.colour.should eql 'B'
  end

  def assert_valid_fill(command)
    command.should be_a Fill_Command
    command.x.should eql 1
    command.y.should eql 1
    command.colour.should eql 'B'
  end
end
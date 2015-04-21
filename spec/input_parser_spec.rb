require "spec_helper"

describe "input_parser" do
  before(:all) do
    @parser = Input_Parser.new
  end

  it "should always start with a Create command" do
    out = capture_io { @parser.parse("C") }.join ''
    out.should eql "Start of input is [C] but should be [I]"
  end

  it "should handle unknown command" do
    out = capture_io { @parser.parse("Unknown command") }.join ''
    out.should eql "Start of input is [Unknown command] but should be [I]"
  end

  it "should handle valid Create command" do
    row_length = 250
    number_of_rows = 248
    commands = @parser.parse("I #{row_length} #{number_of_rows}")

    commands.length.should eql 1
    command = commands[0]
    command.should be_a Create_Image_Command
    command.row_length.should eql row_length
    command.number_of_rows.should eql number_of_rows
  end

  it "should handle invalid Create command" do
    out = capture_io { @parser.parse("I V 6") }.join ''
    out.should eql "Invalid input: [I V 6]"
  end

  it "should handle invalid Create command when the number of columns is too big" do
    out = capture_io { @parser.parse("I 251 6") }.join ''
    out.should eql "Invalid input: [I 251 6]"
  end

  it "should handle invalid Create command when the number of rows is too big" do
    out = capture_io { @parser.parse("I 2 251") }.join ''
    out.should eql "Invalid input: [I 2 251]"
  end

  it "should handle valid Clear command" do
    commands = @parser.parse("I 2 3\nC")

    commands.size.should eql 2
    command = commands[1]
    command.should be_a Clear_Command
  end

  it "should handle valid Colour command" do
    x = 1
    y = 2
    colour = "V"
    commands = @parser.parse("I 2 3\nL #{x} #{y} #{colour}")

    commands.size.should eql 2
    command = commands[1]
    command.should be_a Colour_Command
    command.x.should eql x
    command.y.should eql y
    command.colour.should eql colour
  end

  it "should handle invalid Colour command" do
    out = capture_io { @parser.parse("I 2 3\nL 1 B V") }.join ''
    out.should eql "Invalid input: [L 1 B V]"
  end

  it "should handle invalid Colour command where the specified pixel does not exist" do
    out = capture_io { @parser.parse("I 2 3\nL 4 4 V") }.join ''
    out.should eql "Invalid input: [L 4 4 V]"
  end

  it "should handle valid Vertical Segment command" do
    column = 1
    first_row = 1
    last_row = 2
    colour = "B"
    commands = @parser.parse("I 2 3\nV #{column} #{first_row} #{last_row} #{colour}")

    commands.length.should eql 2
    command = commands[1]
    command.should be_a Vertical_Segment_Command
    command.column.should eql column
    command.first_row.should eql first_row
    command.last_row.should eql last_row
    command.colour.should eql colour
  end

  it "should handle invalid Vertical Segment command" do
    out = capture_io { @parser.parse("I 2 3\nV F 1 2 B") }.join ''
    out.should eql "Invalid input: [V F 1 2 B]"
  end

  it "should handle invalid Vertical Segment command where one of the pixels in the segment does not exist" do
    out = capture_io { @parser.parse("I 2 3\nV 1 4 2 B") }.join ''
    out.should eql "Invalid input: [V 1 4 2 B]"
  end

  it "should handle valid Horizontal Segment command" do
    row = 1
    first_column = 1
    last_column = 2
    colour = "B"
    commands = @parser.parse("I 3 3\nH #{row} #{first_column} #{last_column} #{colour}")

    commands.length.should eql 2
    command = commands[1]
    command.should be_a Horizontal_Segment_Command
    command.row.should eql row
    command.first_column.should eql first_column
    command.last_column.should eql last_column
    command.colour.should eql colour
  end

  it "should handle invalid Horizontal Segment command" do
    out = capture_io { @parser.parse("I 2 3\nH F 1 2 B") }.join ''
    out.should eql "Invalid input: [H F 1 2 B]"
  end

  it "should handle invalid Horizontal Segment command where one of the pixels in the segment does not exist" do
    out = capture_io { @parser.parse("I 2 3\nH 1 4 2 B") }.join ''
    out.should eql "Invalid input: [H 1 4 2 B]"
  end

  it "should handle valid Fill command" do
    x = 1
    y = 1
    colour = "B"
    commands = @parser.parse("I 3 3\nF #{x} #{y} #{colour}")

    commands.length.should eql 2
    command = commands[1]
    command.should be_a Fill_Command
    command.x.should eql x
    command.y.should eql y
    command.colour.should eql colour
  end

  it "should handle invalid Fill command" do
    out = capture_io { @parser.parse("I 2 3\nF G 2 B") }.join ''
    out.should eql "Invalid input: [F G 2 B]"
  end

  it "should handle invalid Horizontal Segment command where the specified pixel does not exist" do
    out = capture_io { @parser.parse("I 2 3\nF 4 2 B") }.join ''
    out.should eql "Invalid input: [F 4 2 B]"
  end

  it "should handle Show command" do
    commands = @parser.parse("I 2 3\nS")

    commands.length.should eql 2
    commands[1].should be_a Show_Command
    end

  it "should handle Terminate command" do
    commands = @parser.parse("I 2 3\nX")

    commands.length.should eql 2
    commands[1].should be_a Terminate_Command
  end

end
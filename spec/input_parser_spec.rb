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
    out = capture_io { @parser.parse("I 250 250") }.join ''
    out.should eql "Bitmap created"
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
    out = capture_io { @parser.parse("I 2 3\nC") }.join ''
    out.should eql "Bitmap created"
  end

  it "should handle valid Colour command" do
    out = capture_io { @parser.parse("I 2 3\nL 1 1 V") }.join ''
    out.should eql "Bitmap created"
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
    out = capture_io { @parser.parse("I 2 3\nV 1 1 2 B") }.join ''
    out.should eql "Bitmap created"
  end

  it "should handle invalid Vertical Segment command" do
    out = capture_io { @parser.parse("I 2 3\nV F 1 2 B") }.join ''
    out.should eql "Invalid input: [V F 1 2 B]"
  end

  it "should handle invalid Vertical Segment command where one of the pixels in the segment does not exist" do
    out = capture_io { @parser.parse("I 2 3\nV 1 4 2 B") }.join ''
    out.should eql "Invalid input: [V 1 4 2 B]"
  end



end
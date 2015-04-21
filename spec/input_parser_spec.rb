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
    out = capture_io { @parser.parse("I 2 3") }.join ''
    out.should eql "Bitmap created"
  end

  it "should handle invalid Create command" do
    out = capture_io { @parser.parse("I V 6") }.join ''
    out.should eql "Invalid input: [I V 6]"
  end

  it "should handle valid Clear command" do
    out = capture_io { @parser.parse("I 2 3\nC") }.join ''
    out.should eql "Bitmap created"
  end

end
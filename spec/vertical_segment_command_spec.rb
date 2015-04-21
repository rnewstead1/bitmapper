require 'spec_helper'

describe "vertical_segment_command" do
  it "should create a vertical segment of colour A in coloumn X between rows Y1 and Y2 inclusive" do
    Vertical_Segment_Command.new(1, 2, 3, "A").execute(["OOO", "OOO", "OOO"]).should eql ["OOO", "AOO", "AOO"]
  end
end
require 'spec_helper'

describe "horizontal_segment_command" do
  it "should create a horizontal segment of colour B in row Y between columns X1 and X2 inclusive" do
     Horizontal_Segment_Command.new(2, 2, 3, "B").execute(["OOO", "OOO", "OOO"]).should eql ["OOO", "OBB", "OOO"]
   end

end
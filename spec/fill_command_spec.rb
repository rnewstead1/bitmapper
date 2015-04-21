require 'spec_helper'

describe "fill_command" do
  it "should fill region R with colour C" do
    Fill_Command.new(2, 3, "C").execute(["OOO", "OOO", "OOO", "OOO"]).should eql ["CCC", "CCC", "CCC", "CCC"]
  end

  it "should only fill surrounding pixels when they are the same colour as X, Y" do
    Fill_Command.new(2, 3, "C").execute(["DDO", "OOO", "OOO", "OOO"]).should eql ["DDC", "CCC", "CCC", "CCC"]
  end
end
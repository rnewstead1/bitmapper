require 'spec_helper'

describe "clear_command" do
  it "should clear all pixels to white" do
    Clear_Command.new.execute(["AO"]).should eql ["OO"]
  end
end
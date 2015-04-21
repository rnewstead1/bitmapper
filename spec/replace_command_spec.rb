require 'spec_helper'

describe "replace_command" do
  it "should replace all pixels of colour A to colour B" do
    Replace_Command.new("A", "B").execute(["AO", "CC", "AA"]).should eql ["BO", "CC", "BB"]
  end
end
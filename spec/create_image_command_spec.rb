require 'spec_helper'

describe "create_image_command" do
  it "should create a 1 x 1 pixel image with all pixels coloured white" do
    Create_Image_Command.new(1, 1).execute.should eql ["O"]
  end

  it "should create a larger image with all pixels coloured white" do
    Create_Image_Command.new(2, 3).execute.should eql ["OO", "OO", "OO"]
  end
end
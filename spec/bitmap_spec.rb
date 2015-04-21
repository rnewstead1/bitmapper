require "spec_helper"

describe "bitmap" do
  it "should create a 1 x 1 pixel image with all pixels coloured white for command I" do
    Bitmap.new("I 1 1").bitmap.should eql ["O"]
  end

  it "should create a larger image with all pixels coloured white for command I" do
    Bitmap.new("I 2 3").bitmap.should eql ["OO", "OO", "OO"]
  end

end
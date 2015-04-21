require "spec_helper"

describe "bitmap" do
  it "should create a 1 x 1 pixel image with all pixels coloured white for command I" do
    Bitmap.new("I 1 1").bitmap.should eql ["O"]
  end

  it "should create a larger image with all pixels coloured white for command I" do
    Bitmap.new("I 2 3").bitmap.should eql ["OO", "OO", "OO"]
  end

  it "should colour pixel (X, Y) with colour C for command L" do
    Bitmap.new("I 2 1\nL 1 1 A").bitmap.should eql ["AO"]
  end

  it "should set all pixels to white for command C" do
    Bitmap.new("I 2 1\nL 1 1 A\nC").bitmap.should eql ["OO"]
  end

end
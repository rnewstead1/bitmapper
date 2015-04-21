require "spec_helper"

describe "bitmap" do
  it "should create a 1 x 1 pixel image with all pixels coloured white for command I" do
    Bitmap.new("I 1 1").bitmap.should eql ["O"]
  end

  it "should create a larger image with all pixels coloured white for command I" do
    Bitmap.new("I 2 3").bitmap.should eql ["OO", "OO", "OO"]
  end

  it "should colour pixel (X, Y) with colour C for command L" do
    Bitmap.new("I 2 2\nL 1 1 A").bitmap.should eql ["AO", "OO"]
  end

  it "should set all pixels to white for command C" do
    Bitmap.new("I 2 1\nL 1 1 A\nC").bitmap.should eql ["OO"]
  end

  it "should create a vertical segment of colour C in coloumn X between rows Y1 and Y2 inclusive for command V" do
    Bitmap.new("I 3 3\nV 1 2 3 A").bitmap.should eql ["OOO", "AOO", "AOO"]
  end

  it "should create a horizontal segment of colour C in row Y between columns X1 and X2 inclusive" do
    Bitmap.new("I 3 3\nH 2 2 3 B").bitmap.should eql ["OOO", "OBB", "OOO"]
  end

end
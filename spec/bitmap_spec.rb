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

  it "should fill region R with colour C" do
    Bitmap.new("I 3 4\nF 2 3 C").bitmap.should eql ["CCC", "CCC", "CCC", "CCC"]
  end

  it "should only fill surrounding pixels when they are the same colour as X, Y" do
    Bitmap.new("I 3 4\nH 1 1 2 D\nF 2 3 C").bitmap.should eql ["DDC", "CCC", "CCC", "CCC"]
  end

  it "should show the contents of the current image for the command S" do
    out = capture_io{Bitmap.new("I 2 2\nS")}.join ''
    out.should eql "OO\nOO"
  end

  it "should terminate the session for command X" do
    Bitmap.new("I 3 4\nH 1 1 2 D\nF 2 3 C\nX").bitmap.should eql []
  end

  it "should not crash with unknown command" do
    out = capture_io{Bitmap.new("Invalid command")}.join ''
    out.should eql "[Invalid command] is not a valid input"
  end

end
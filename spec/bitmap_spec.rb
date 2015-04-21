require "spec_helper"

describe "bitmap" do
  before(:each) do
    @bitmap = Bitmap.new
  end

  it "should create a 1 x 1 pixel image with all pixels coloured white" do
    @bitmap.create(1, 1).bitmap.should eql ["O"]
  end

  it "should create a larger image with all pixels coloured white" do
    @bitmap.create(2, 3).bitmap.should eql ["OO", "OO", "OO"]
  end

  it "should colour pixel (X, Y) with colour A" do
    @bitmap.create(2, 2).colour(1, 1, "A").bitmap.should eql ["AO", "OO"]
  end

  it "should clear all pixels to white" do
    @bitmap.create(2, 1).colour(1, 1, "A").clear.bitmap.should eql ["OO"]
  end

  it "should create a vertical segment of colour A in coloumn X between rows Y1 and Y2 inclusive" do
    @bitmap.create(3, 3).vertical_segment(1, 2, 3, "A").bitmap.should eql ["OOO", "AOO", "AOO"]
  end

  it "should create a horizontal segment of colour B in row Y between columns X1 and X2 inclusive" do
    @bitmap.create(3, 3).horizontal_segment(2, 2, 3, "B").bitmap.should eql ["OOO", "OBB", "OOO"]
  end

  it "should fill region R with colour C" do
    @bitmap.create(3, 4).fill(2, 3, "C").bitmap.should eql ["CCC", "CCC", "CCC", "CCC"]
  end

  it "should only fill surrounding pixels when they are the same colour as X, Y" do
    @bitmap.create(3, 4).horizontal_segment(1, 1, 2, "D").fill(2, 3, "C").bitmap.should eql ["DDC", "CCC", "CCC", "CCC"]
  end

  it "should show the contents of the current image" do
    out = capture_io { @bitmap.create(2, 2).show }.join ''
    out.should eql "OO\nOO"
  end

  it "should terminate the session" do
    @bitmap.create(3, 4).horizontal_segment(1, 1, 2, "D").fill(2, 3, "C").terminate().bitmap.should eql []
  end

end
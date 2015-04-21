require 'spec_helper'

describe "bitmapper" do
  it "should chain two commands" do
    out = capture_io { Bitmapper.new.bitmap("fixtures/simple-bitmap.txt")}.join ''
    out.should eql "OO\nOO\nOO\n"
  end

  it "should chain many commands" do
    out = capture_io { Bitmapper.new.bitmap("fixtures/complex-bitmap.txt")}.join ''
    out.should eql "OOOOO\nOOOOO\nOAOOO\nOOOOO\nOOOOO\nOOOOO\nJJJJJ\nJJZZJ\nJWJJJ\nJWJJJ\nJJJJJ\nJJJJJ\n"
  end

end
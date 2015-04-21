require 'spec_helper'

describe "bitmapper" do
  it "should chain two commands" do
    out = capture_io { Bitmapper.new.bitmap("I 2 3\nS")}.join ''
    out.should eql "OO\nOO\nOO\n"
  end

  it "should chain many commands" do
    out = capture_io { Bitmapper.new.bitmap("I 5 6\nL 2 3 A\nS\nF 3 3 J\nV 2 3 4 W\nH 3 4 2 Z\nS")}.join ''
    out.should eql "OOOOO\nOOOOO\nOAOOO\nOOOOO\nOOOOO\nOOOOO\nJJJJJ\nJJZZJ\nJWJJJ\nJWJJJ\nJJJJJ\nJJJJJ\n"
  end

end
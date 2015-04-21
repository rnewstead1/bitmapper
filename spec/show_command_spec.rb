require 'spec_helper'

describe "show_command" do
  it "should show the contents of the current image" do
    bitmap = []
    out = capture_io { bitmap = Show_Command.new.execute(["OO", "OO"])
    bitmap }.join ''

    out.should eql "OO\nOO\n"
    bitmap.should eql ["OO", "OO"]
  end
end
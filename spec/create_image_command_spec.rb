require 'spec_helper'

describe 'create_image_command' do
  it 'should create a 1 x 1 pixel image with all pixels coloured white' do
    Create_Image_Command.new(1, 1).execute(Array.new).should eql ['O']
  end

  it 'should create a larger image with all pixels coloured white' do
    Create_Image_Command.new(2, 3).execute(Array.new).should eql ['OO', 'OO', 'OO']
  end

  it 'should be a Command' do
     Create_Image_Command.new(1, 1).should be_a Command
   end
end
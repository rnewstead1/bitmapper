require 'spec_helper'

describe 'colour_command' do
  it 'should colour pixel (X, Y) with colour A' do
    Colour_Command.new(1, 1, 'A').execute(['OO', 'OO']).should eql ['AO', 'OO']
  end

  it 'should be a Command' do
     Colour_Command.new(1, 1, 'A').should be_a Command
   end
end
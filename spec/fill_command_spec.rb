require 'spec_helper'
require 'command'
require 'fill_command'

describe 'fill_command' do
  it 'should fill region R with colour C' do
    Fill_Command.new(2, 3, 'C').execute(['OOO', 'OOO', 'OOO', 'OOO']).should eql ['CCC', 'CCC', 'CCC', 'CCC']
  end

  it 'should only fill surrounding pixels when they are the same colour as X, Y' do
    Fill_Command.new(2, 3, 'C').execute(['DDO', 'OOO', 'OOO', 'OOO']).should eql ['DDC', 'CCC', 'CCC', 'CCC']
  end

  it 'should be a Command' do
     Fill_Command.new(1, 1, 'A').should be_a Command
   end
end
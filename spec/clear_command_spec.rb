require 'spec_helper'
require 'command'
require 'clear_command'

describe 'clear_command' do
  it 'should clear all pixels to white' do
    Clear_Command.new.execute(['AO']).should eql ['OO']
  end

  it 'should be a Command' do
    Clear_Command.new.should be_a Command
  end
end
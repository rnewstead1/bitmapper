require 'spec_helper'
require 'command'
require 'terminate_command'

describe 'terminate_command' do
  it 'should terminate the session' do
    Terminate_Command.new.execute(['OOO', 'OCV', 'BBD']).should eql []
  end

  it 'should be a Command' do
    Terminate_Command.new.should be_a Command
  end
end
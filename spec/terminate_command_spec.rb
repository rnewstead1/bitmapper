require 'spec_helper'

describe 'terminate_command' do
  it 'should terminate the session' do
    Terminate_Command.new.execute(['OOO', 'OCV', 'BBD']).should eql []
  end

end
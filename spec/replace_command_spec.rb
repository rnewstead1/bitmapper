require 'spec_helper'
require 'command'
require 'replace_command'

describe 'replace_command' do
  it 'should replace all pixels of colour A to colour B' do
    Replace_Command.new('A', 'B').execute(['AO', 'CC', 'AA']).should eql ['BO', 'CC', 'BB']
  end

  it 'should be a Command' do
    Replace_Command.new('A', 'B').should be_a Command
  end
end
require 'spec_helper'

describe 'horizontal_segment_command' do
  it 'should create a horizontal segment of colour B in row Y between columns X1 and X2 inclusive' do
    Horizontal_Segment_Command.new(3, 4, 2, 'Z')
            .execute(['OOOOO', 'OOOOO', 'OOOOO', 'OOOOO', 'OOOOO']).should eql ['OOOOO', 'OOZZO', 'OOOOO', 'OOOOO', 'OOOOO']
  end

end
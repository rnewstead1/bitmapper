require 'spec_helper'
require 'bitmapper'
require 'input_parser'
require 'command'
require 'create_image_command'
require 'colour_command'
require 'vertical_segment_command'
require 'horizontal_segment_command'
require 'fill_command'
require 'show_command'

describe 'bitmapper' do
  it 'should chain two commands' do
    out = capture_io { Bitmapper.new.bitmap('fixtures/simple-bitmap.txt')}.join ''
    out.should eql "OO\nOO\nOO\n"
  end

  it 'should chain many commands' do
    out = capture_io { Bitmapper.new.bitmap('fixtures/complex-bitmap.txt')}.join ''
    out.should eql "OOOOO\nOOOOO\nOAOOO\nOOOOO\nOOOOO\nOOOOO\nJJJJJ\nJJZZJ\nJWJJJ\nJWJJJ\nJJJJJ\nJJJJJ\n"
  end

end
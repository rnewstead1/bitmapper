require 'input_parser'
require 'create_image_command'
require 'clear_command'
require 'colour_command'
require 'vertical_segment_command'
require 'horizontal_segment_command'
require 'fill_command'
require 'show_command'
require 'terminate_command'
require 'bitmapper'

require 'spec'
require 'minitest/unit'

Spec::Runner.configure do |c|
  c.include MiniTest::Assertions
end


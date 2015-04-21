class Vertical_Segment_Command

  attr_reader :column, :first_row, :last_row, :colour

  def initialize(column, first_row, last_row, colour)
    @column = column
    @first_row = first_row
    @last_row = last_row
    @colour = colour
  end

end
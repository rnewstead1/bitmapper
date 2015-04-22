class Vertical_Segment_Command

  attr_reader :column, :first_row, :last_row, :colour

  def initialize(column, first_row, last_row, colour)
    @column = column
    @first_row = first_row
    @last_row = last_row
    @colour = colour
  end

  def execute(bitmap)
    new_bitmap = bitmap.dup
    (@first_row..@last_row).each do |i|
      row = new_bitmap[i-1]
      row[@column-1] = @colour
    end
    new_bitmap
  end

end
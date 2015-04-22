class Horizontal_Segment_Command < Command

  attr_reader :row, :first_column, :last_column, :colour

  def initialize(first_column, last_column, row, colour)
    @row = row
    @first_column = first_column
    @last_column = last_column
    @colour = colour
  end

  def execute(bitmap)
    new_bitmap = bitmap.dup
    (@first_column..@last_column).each do |i|
      row = new_bitmap[@row-1]
      row[i-1] = @colour
    end
    new_bitmap
  end

end
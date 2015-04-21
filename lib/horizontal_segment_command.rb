class Horizontal_Segment_Command

  attr_reader :row, :first_column, :last_column, :colour

  def initialize(row, first_column, last_column, colour)
    @row = row
    @first_column = first_column
    @last_column = last_column
    @colour = colour
  end

  def execute(bitmap)
    (@first_column..@last_column).each do |i|
      row = bitmap[@row-1]
      row[i-1] = @colour
    end
    bitmap
  end

end
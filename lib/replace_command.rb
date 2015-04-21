class Replace_Command
  def initialize(old_colour, new_colour)
    @old_colour = old_colour
    @new_colour = new_colour
  end

  def execute(bitmap)
    bitmap.each_with_index { |row, index|
      updated = row.gsub(@old_colour, @new_colour)
      bitmap[index] = updated
    }
    bitmap
  end
end
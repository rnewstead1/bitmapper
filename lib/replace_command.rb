class Replace_Command < Command
  def initialize(old_colour, new_colour)
    @old_colour = old_colour
    @new_colour = new_colour
  end

  def execute(bitmap)
    new_bitmap = bitmap.dup
    new_bitmap.each_with_index { |row, index|
      updated = row.gsub(@old_colour, @new_colour)
      new_bitmap[index] = updated
    }
    new_bitmap
  end
end
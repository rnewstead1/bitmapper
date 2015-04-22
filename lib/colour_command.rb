class Colour_Command

  attr_reader :x, :y, :colour

  def initialize(x, y, colour)
    @x = x
    @y = y
    @colour = colour
  end

  def execute(bitmap)
    new_bitmap = bitmap.dup
    row = new_bitmap[@y-1]
    row[@x-1] = @colour
    new_bitmap
  end

end
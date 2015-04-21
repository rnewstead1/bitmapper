class Colour_Command

  attr_reader :x, :y, :colour

  def initialize(x, y, colour)
    @x = x
    @y = y
    @colour = colour
  end

  def execute(bitmap)
    row = bitmap[@y-1]
    row[@x-1] = @colour
    bitmap
  end

end
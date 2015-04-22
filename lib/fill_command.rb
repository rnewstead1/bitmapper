class Fill_Command

  attr_reader :x, :y, :colour

  def initialize(x, y, colour)
    @x = x
    @y = y
    @colour = colour
  end

  def execute(bitmap)
    new_bitmap = bitmap.dup
    initial_colour = new_bitmap[@y-1][@x-1]
    inner(new_bitmap, @x, @y, @colour, initial_colour)
    new_bitmap
  end

  private
  def inner(bitmap, x, y, new_colour, initial_colour)
    update_colour(bitmap, x, y, new_colour)
    surrounding = [[x-1, y], [x+1, y], [x, y-1], [x, y+1]]
    surrounding.each do |x, y|
      current_pixel_colour = bitmap[y-1][x-1]
      if current_pixel_colour.eql? initial_colour
        update_colour(bitmap, x, y, new_colour)
        inner(bitmap, x, y, new_colour, initial_colour)
      end
    end
  end

  def update_colour(bitmap, x, y, colour)
    row = bitmap[y-1]
    row[x-1] = colour
  end

end
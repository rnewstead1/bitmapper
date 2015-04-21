class Bitmap
  attr_accessor :bitmap

  def create(row_length, number_of_rows)
    @bitmap = Array.new
    (1..number_of_rows).each do |i|
      row = create_row(row_length, "O")
      @bitmap[i-1] = row
    end
    self
  end

  def colour(x, y, colour)
    row = @bitmap[y-1]
    row[x-1] = colour
    self
  end

  def clear
    @bitmap.map! { |row|
      create_row(row.length, "O")
    }
    self
  end

  def vertical_segment(column, start_row, end_row, colour)
    (start_row..end_row).each do |row|
      colour(column, row, colour)
    end
    self
  end

  def horizontal_segment(row, start_column, end_column, colour)
    (start_column..end_column).each do |column|
      colour(column, row, colour)
    end
    self
  end

  def fill(x, y, colour)
    initial_colour = @bitmap[y-1][x-1]
    inner(x, y, colour, initial_colour)
    self
  end

  def show
    print @bitmap.join("\n")
    self
  end

  def terminate
    @bitmap = Array.new
    self
  end

  private

  def get_colour(x, y)
    @bitmap[y-1][x-1]
  end

  def create_row(row_length, colour)
    row = ""
    (1..row_length).each do
      row += colour
    end
    row
  end

  def inner(x, y, new_colour, initial_colour)
    colour(x, y, new_colour)
    surrounding = [[x-1, y], [x+1, y], [x, y-1], [x, y+1]]
    surrounding.each do |x, y|
      current_pixel_colour = get_colour(x, y)
      if current_pixel_colour.eql? initial_colour
        colour(x, y, new_colour)
        inner(x, y, new_colour, initial_colour)
      end
    end
  end

end

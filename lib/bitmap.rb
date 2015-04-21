class Bitmap
  attr_accessor :bitmap

  def initialize(input_string)
    input_string.split("\n").each do |line|
      input = line.split(" ")
      command = input[0]
      case command
        when "I"
          create(input[1].to_i, input[2].to_i)
        when "L"
          replace_pixel(input[1].to_i, input[2].to_i, input[3])
        when "C"
          clear
        when "V"
          vertical_segment(input[1].to_i, input[2].to_i, input[3].to_i, input[4])
        when "H"
          horizontal_segment(input[1].to_i, input[2].to_i, input[3].to_i, input[4])
        when "F"
          fill(input[1].to_i, input[2].to_i, input[3])
        when "S"
          print @bitmap.join("\n")
        when "X"
          @bitmap = []
        else
          print "[#{ input_string }] is not a valid input"
      end
    end
  end

  private

  def create(row_length, number_of_rows)
    @bitmap = []
    (1..number_of_rows).each do |i|
      row = create_row(row_length, "O")
      @bitmap[i-1] = row
    end
  end

  def create_row(row_length, colour)
    row = ""
    (1..row_length).each do
      row += colour
    end
    row
  end

  def replace_pixel(x, y, colour)
    row = @bitmap[y-1]
    row[x-1] = colour
  end

  def clear
    @bitmap.map! { |row|
      create_row(row.length, "O")
    }
  end

  def vertical_segment(column, start_row, end_row, colour)
    (start_row..end_row).each do |row|
      replace_pixel(column, row, colour)
    end
  end

  def horizontal_segment(row, start_column, end_column, colour)
    (start_column..end_column).each do |column|
      replace_pixel(column, row, colour)
    end
  end

  def fill(x, y, colour)
    initial_colour = colour(x, y)
    inner(x, y, colour, initial_colour)
  end

  def inner(x, y, new_colour, initial_colour)
    replace_pixel(x, y, new_colour)
    surrounding = [[x-1, y], [x+1, y], [x, y-1], [x, y+1]]
    surrounding.each do |x, y|
      current_pixel_colour = colour(x, y)
      if current_pixel_colour.eql? initial_colour
        replace_pixel(x, y, new_colour)
        inner(x, y, new_colour, initial_colour)
      end
    end
  end

  def colour(x, y)
    @bitmap[y-1][x-1]
  end

end

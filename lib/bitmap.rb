class Bitmap
  attr_accessor :bitmap

  def initialize(input_string)
    input_string.split("\n").each do |line|
      input = line.split(" ")
      command = input[0]
      if command.eql? "I"
          create(input[1].to_i, input[2].to_i)
        else
          colour(input[1].to_i, input[2].to_i, input[3])
      end
    end
  end

  private

  def create(row_length, number_of_rows)
    @bitmap = []
    (1..number_of_rows).each do |i|
      row = ""
      (1..row_length).each do
        row += "O"
      end
      @bitmap[i-1] = row
    end
    @bitmap
  end

  def colour(x, y, colour)
    row = @bitmap[y-1]
    update_row(row, row.sub(row[x-1], colour))
  end

  def update_row(row_to_update, updated)
    @bitmap.map! { |row|
      if row.eql? row_to_update
        updated
      else
        row
      end
    }
    @bitmap
  end

end

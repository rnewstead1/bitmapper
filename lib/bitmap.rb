class Bitmap
  attr_accessor :bitmap

  def initialize(input_string)
    input = input_string.split(" ")
    create(input[1].to_i, input[2].to_i)
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

end

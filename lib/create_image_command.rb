class Create_Image_Command

  attr_reader :row_length, :number_of_rows

  def initialize(row_length, number_of_rows)
    @row_length = row_length
    @number_of_rows = number_of_rows
  end

  def execute(bitmap)
    new_bitmap = bitmap.dup
    (1..@number_of_rows).each do |i|
      row = ''
      (1..@row_length).each do
        row += 'O'
      end
      new_bitmap[i-1] = row
    end
    new_bitmap
  end

end
class Create_Image_Command

  attr_reader :row_length, :number_of_rows

  def initialize(row_length, number_of_rows)
    @row_length = row_length
    @number_of_rows = number_of_rows
  end

  def execute(bitmap)
    (1..@number_of_rows).each do |i|
      row = ''
      (1..@row_length).each do
        row += 'O'
      end
      bitmap[i-1] = row
    end
    bitmap
  end

end
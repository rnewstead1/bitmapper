class Create_Image_Command

  attr_reader :row_length, :number_of_rows

  def initialize(row_length, number_of_rows)
    @row_length = row_length
    @number_of_rows = number_of_rows
  end

end
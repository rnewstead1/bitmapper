class Clear_Command
  def execute(bitmap)
    bitmap.map! { |row|
      row1 = ""
      (1..row.length).each do
        row1 += "O"
      end
      row1
    }
    bitmap
  end
end
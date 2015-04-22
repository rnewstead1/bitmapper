class Clear_Command
  def execute(bitmap)
    new_bitmap = bitmap.dup
    new_bitmap.map! { |row|
      row1 = ''
      (1..row.length).each do
        row1 += 'O'
      end
      row1
    }
    new_bitmap
  end
end
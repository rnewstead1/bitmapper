class Show_Command
  def execute(bitmap)
    puts bitmap.join("\n")
    bitmap
  end
end
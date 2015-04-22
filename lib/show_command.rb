class Show_Command < Command
  def execute(bitmap)
    puts bitmap.join("\n")
    bitmap
  end
end
class Show_Command
  def execute(bitmap)
    print bitmap.join("\n")
    bitmap
  end
end
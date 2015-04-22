class Bitmapper

  def initialize
    @input_parser = Input_Parser.new
  end

  def bitmap(file_name)
    file = File.open(file_name, 'r')
    input = file.read
    commands = @input_parser.parse(input)
    initial_bitmap = commands[0].execute(Array.new)
    commands.shift
    build_bitmap(initial_bitmap, commands)
  end

  private
  def build_bitmap(bitmap, commands)
    until commands.empty?
      updated_bitmap = commands[0].execute(bitmap)
      commands.shift
      build_bitmap(updated_bitmap, commands)
    end
    bitmap
  end
end
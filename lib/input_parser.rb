class Input_Parser

  def parse(input_string)
    lines = input_string.split("\n")
    errors = Array.new
    commands = Array.new
    first_line_inputs = lines[0].split
    number_of_columns = first_line_inputs[1].to_i
    number_of_rows = first_line_inputs[2].to_i
    if first_line_inputs[0].eql?("I")
      lines.each do |line|
        input = line.split
        command = input[0]
        case command
          when "I"
            if line.match(/I ([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|250) ([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|250)$/)
              commands.push(Create_Image_Command.new(input[1].to_i, input[2].to_i))
            else
              errors.push("Invalid input: [#{ line }]")
            end
          when "C"
            if line.match(/C/)
              commands.push(Clear_Command.new)
            else
              errors.push("Invalid input: [#{ line }]")
            end
          when "L"
            x = input[1].to_i
            y = input[2].to_i
            if line.match(/L [0-9] [0-9] [A-Z]/) &&
                    x < number_of_columns &&
                    y < number_of_rows
              commands.push(Colour_Command.new(x, y, input[3]))
            else
              errors.push("Invalid input: [#{ line }]")
            end
          when "V"
            column = input[1].to_i
            first_row = input[2].to_i
            last_row = input[3].to_i
            if line.match(/V [0-9] [0-9] [0-9] [A-Z]/) &&
                    column < number_of_columns &&
                    first_row < number_of_rows &&
                    last_row < number_of_rows
              commands.push(Vertical_Segment_Command.new(column, first_row, last_row, input[4]))
            else
              errors.push("Invalid input: [#{ line }]")
            end
          else
            errors.push("Invalid input: [#{ line }]")
        end
      end
    else
      errors.push("Start of input is [#{ input_string }] but should be [I]")
    end
    if errors.empty?
      commands
    else
      print errors.join("\n")
    end
  end


end
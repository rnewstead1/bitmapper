class Input_Parser

  def parse(input_string)
    lines = input_string.split("\n")
    errors = Array.new
    commands = Array.new
    first_line_inputs = lines[0].split
    number_of_columns = first_line_inputs[1].to_i
    number_of_rows = first_line_inputs[2].to_i

    if first_line_inputs[0].eql?('I')
      lines.each do |line|
        command = line.split[0]
        case command
          when 'I'
            parse_create_command(commands, errors, line)
          when 'C'
            parse_clear_command(commands, errors, line)
          when 'L'
            parse_colour_command(commands, errors, line, number_of_columns, number_of_rows)
          when 'V'
            parse_vertical_segment_command(commands, errors, line, number_of_columns, number_of_rows)
          when 'H'
            parse_horizontal_segment_command(commands, errors, line, number_of_columns, number_of_rows)
          when 'F'
            parse_fill_command(commands, errors, line, number_of_columns, number_of_rows)
          when 'S'
            parse_show_command(commands, errors, line)
          when 'X'
            parse_terminate_command(commands, errors, line)
          when 'R'
            parse_replace_command(commands, errors, line)
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

  def parse_replace_command(commands, errors, line)
    input = line.split
    if line.match(/R [A-Z] [A-Z]/)
      commands.push(Replace_Command.new(input[1], input[2]))
    else
      errors.push("Invalid input: [#{ line }]")
    end
  end

  def parse_terminate_command(commands, errors, line)
    if line.eql? 'X'
      commands.push(Terminate_Command.new)
    else
      errors.push("Invalid input: [#{ line }]")
    end
  end

  def parse_show_command(commands, errors, line)
    if line.eql? 'S'
      commands.push(Show_Command.new)
    else
      errors.push("Invalid input: [#{ line }]")
    end
  end

  def parse_fill_command(commands, errors, line, number_of_columns, number_of_rows)
    input = line.split
    x = input[1].to_i
    y = input[2].to_i
    if line.match(/F [0-9] [0-9] [A-Z]/) &&
            x < number_of_columns &&
            y < number_of_rows
      commands.push(Fill_Command.new(x, y, input[3]))
    else
      errors.push("Invalid input: [#{ line }]")
    end
  end

  def parse_horizontal_segment_command(commands, errors, line, number_of_columns, number_of_rows)
    input = line.split
    row = input[1].to_i
    first_column = input[2].to_i
    last_column = input[3].to_i
    if line.match(/H [0-9] [0-9] [0-9] [A-Z]/) &&
            row < number_of_rows &&
            first_column < number_of_columns &&
            last_column < number_of_columns
      commands.push(Horizontal_Segment_Command.new(row, first_column, last_column, input[4]))
    else
      errors.push("Invalid input: [#{ line }]")
    end
  end

  def parse_vertical_segment_command(commands, errors, line, number_of_columns, number_of_rows)
    input = line.split
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
  end

  def parse_colour_command(commands, errors, line, number_of_columns, number_of_rows)
    input = line.split
    x = input[1].to_i
    y = input[2].to_i
    if line.match(/L [0-9] [0-9] [A-Z]/) &&
            x < number_of_columns &&
            y < number_of_rows
      commands.push(Colour_Command.new(x, y, input[3]))
    else
      errors.push("Invalid input: [#{ line }]")
    end
  end

  def parse_clear_command(commands, errors, line)
    if line.eql? 'C'
      commands.push(Clear_Command.new)
    else
      errors.push("Invalid input: [#{ line }]")
    end
  end

  def parse_create_command(commands, errors, line)
    input = line.split
    if line.match(/I ([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|250) ([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|250)$/)
      commands.push(Create_Image_Command.new(input[1].to_i, input[2].to_i))
    else
      errors.push("Invalid input: [#{ line }]")
    end
  end

end
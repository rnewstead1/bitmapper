class Input_Parser

  def parse(input_string)
    lines = input_string.split("\n")
    errors = Array.new
    first_line_inputs = lines[0].split
    number_of_columns = first_line_inputs[1].to_i
    number_of_rows = first_line_inputs[2].to_i
    if first_line_inputs[0].eql?("I")
      lines.each do |line|
        command = line.split(" ")[0]
        line_errors = validate(command, line, number_of_columns, number_of_rows)
        if !line_errors.empty?
          errors.push(line_errors)
        end
      end
    else
      errors.push("Start of input is [#{ input_string }] but should be [I]")
    end
    if errors.empty?
      print "Bitmap created"
    else
      print errors.join("\n")
    end
  end

  def validate(command, line, number_of_columns, number_of_rows)
    errors = Array.new
    case command
      when "I"
        unless line.match(/I ([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|250) ([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|250)$/)
          errors.push("Invalid input: [#{ line }]")
        end
      when "C"
        unless line.match(/C/)
          errors.push("Invalid input: [#{ line }]")
        end
      when "L"
        unless line.match(/L [0-9] [0-9] [A-Z]/)
          errors.push("Invalid input: [#{ line }]")
        end
        input = line.split
        x = input[1].to_i
        y = input[2].to_i
        if x > number_of_columns || y > number_of_rows
          errors.push("Invalid input: [#{ line }]")
        end
      when "V"
        unless line.match(/V [0-9] [0-9] [0-9] [A-Z]/)
          errors.push("Invalid input: [#{ line }]")
        end
        input = line.split
        column = input[1].to_i
        first_row = input[2].to_i
        last_row = input[3].to_i
        if column > number_of_columns || first_row > number_of_rows || last_row > number_of_rows
          errors.push("Invalid input: [#{ line }]")
        end
      else
        errors.push("Invalid input: [#{ line }]")
    end
    errors
  end

end
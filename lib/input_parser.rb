class Input_Parser
  @@valid_number_range = /^([01][0-9][0-9]|2[0-4][0-9]|25[0-5])$/

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
      Bitmap.new(input_string)
      print "Bitmap created"
    else
      print errors.join("\n")
    end
  end

  def validate(command, line, number_of_columns, number_of_rows)
    errors = Array.new
    case command
      when "I"
        validate_syntax(errors, line, /I ([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|250) ([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|250)$/)
      when "C"
        validate_syntax(errors, line, /C/)
      when "L"
        validate_syntax(errors, line, /L [0-9] [0-9] [A-Z]/)
        validate_pixel_exists(errors, line, number_of_columns, number_of_rows)
      else
        errors.push("Invalid input: [#{ line }]")
    end
    errors
  end

  def validate_pixel_exists(errors, line, number_of_columns, number_of_rows)
    input = line.split
    x = input[1].to_i
    y = input[2].to_i
    if x > number_of_columns || y > number_of_rows
      errors.push("Invalid input: [#{ line }]")
    end
  end

  def validate_syntax(errors, line, regexp)
    if line.match(regexp)
    else
      errors.push("Invalid input: [#{ line }]")
    end
  end

end
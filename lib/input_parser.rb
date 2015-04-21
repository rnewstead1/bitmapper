class Input_Parser

  def parse(input_string)
    lines = input_string.split("\n")
    errors = Array.new
    if lines[0].start_with?("I")
      lines.each do |line|
        command = line.split(" ")[0]
        line_errors = validate(command, line)
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

  def validate(command, line)
    errors = Array.new
    case command
      when "I"
        validate_command(errors, line, /[I] [0-9] [0-9]/)
      when "C"
        validate_command(errors, line, /C/)
      else
        errors.push("Invalid input: [#{ line }]")
    end
    errors
  end

  def validate_command(errors, line, regexp)
    if line.match(regexp)
    else
      errors.push("Invalid input: [#{ line }]")
    end
  end

end
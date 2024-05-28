class Operation
  def sum_numbers(value)
    return 0 if value.empty?
    numbers = extract_numbers(value)
    inspect_negatives(numbers)
    numbers.reduce(0, :+)
  end

  private

  def extract_numbers(value)
    raise StandardError, "invalid value" if ends_with_newline?(value)
    delimiter, string_with_number = extract_delimiter_and_numbers(value)
    string_with_number.split(delimiter).map(&:to_i)
  end

  def extract_delimiter_and_numbers(value)
    delimiter, string_with_number = if value.start_with?("//")
      [value[2], value.split("\n", 2).last]
    else
      [/[\n,]/, value]
    end
  end

  def inspect_negatives(numbers)
    negatives = numbers.select { |num| num < 0 }
    raise StandardError, "Can not enter negative numbers: #{negatives.join(',')}" if negatives.any?
  end

  def ends_with_newline?(value)
    value.end_with?(",\n")
  end
end

class DatToHash
  def initialize(file_path:, column_keys:, column_lengths:)
    @file_path = file_path
    @column_keys = column_keys
    @column_lengths = column_lengths
  end

  def execute(delimiter_start = 6, delimiter_end = 35)
    weather_data = []
    File.open(@file_path).each_with_index do |line, line_number|
      next if line_number < delimiter_start || line_number > delimiter_end
      
      parsed_data = parse_line(line)
      day_data = build_day_data(parsed_data)
    
      weather_data << day_data
    end

    parse(weather_data)
  end

  private

  def parse_line(line)
    parsed_data = []
    column_start = 0
  
    @column_lengths.each do |length|
      parsed_data << line[column_start, length].strip if line[column_start, length]
      column_start += length + 1
    end
  
    parsed_data
  end
  
  def build_day_data(parsed_data)
    @column_keys.zip(parsed_data).to_h
  end

  def parse(weather_data)
    parsed_data = []
    weather_data.each do |data|
      parsed_data << {
        dy: data[:dy],
        spread: data[:max_temp].to_i - data[:min_temp].to_i,
      }
    end
    parsed_data
  end
end
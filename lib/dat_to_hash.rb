module DatToHash
  def initialize(file_path:)
    @file_path = file_path
    @column_keys = self.class::COLUMN_KEYS
    @column_lengths = self.class::COLUMN_LENGTHS
  end

  def execute(delimiter_start = 6, delimiter_end = 35)
    data = []
    File.open(@file_path).each_with_index do |line, line_number|
      next if line_number < delimiter_start || line_number > delimiter_end
      
      parsed_data = parse_line(line)
      day_data = build_day_data(parsed_data)

      data << day_data
    end

    parse(data)
  end

  private

  def parse_line(line)
    parsed_data = []
    column_start = 0
  
    @column_lengths.each do |length|
      parsed_data << line[column_start, length].gsub(/[^a-zA-Z0-9\s]/, '').strip if line[column_start, length]
      column_start += length + 1
    end
  
    parsed_data
  end
  
  def build_day_data(parsed_data)
    @column_keys.zip(parsed_data).to_h
  end
end
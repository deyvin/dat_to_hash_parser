require './lib/dat_to_hash'

class Soccer
  COLUMN_LENGTHS = [6, 14, 2, 6, 4, 5, 5, 3, 4, 5]
  COLUMN_KEYS = [
    :number, :team, :p, :w, :l, :d, :f, :a, :pts
  ]

  include DatToHash

  private
    def parse(weather_data)
      parsed_data = []
      weather_data.each do |data|
        parsed_data << {
          team: data[:team],
          spread: (data[:f].to_i - data[:a].to_i).abs,
        }
      end
      parsed_data
    end
end
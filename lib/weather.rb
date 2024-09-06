require './lib/dat_to_hash'

class Weather
  include DatToHash

  COLUMN_LENGTHS = [4, 5, 4, 4, 7, 5, 5, 4, 5, 5, 4, 3, 4, 3, 3, 2, 6]
  COLUMN_KEYS = [
    :dy, :max_temp, :min_temp, :avg_temp, :hdday, :avdp, :one_hr_p, 
    :tp_cpn, :wx_type, :p_dir, :av_sp, :dir, :max_s, :sky_c, :max_r, :min_r, :av_slp
  ]

  private
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

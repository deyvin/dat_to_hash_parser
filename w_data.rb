require './lib/weather'

data = Weather.new(file_path: './data/w_data.dat').execute
p data.sort_by{|r| r[:spread] }.first
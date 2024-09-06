require './lib/soccer'

data = Soccer.new(file_path: './data/soccer.dat').execute(3, 17)
p data.sort_by{|r| r[:spread] }.first
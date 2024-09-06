require './lib/dat_to_hash'

COLUMN_LENGTHS = [4, 5, 4, 4, 7, 5, 5, 4, 5, 5, 4, 3, 4, 3, 3, 2, 6]
COLUMN_KEYS = [
  :dy, :max_temp, :min_temp, :avg_temp, :hdday, :avdp, :one_hr_p, 
  :tp_cpn, :wx_type, :p_dir, :av_sp, :dir, :max_s, :sky_c, :max_r, :min_r, :av_slp
]

data = DatToHash.new(file_path: 'w_data.dat', column_keys: COLUMN_KEYS, column_lengths: COLUMN_LENGTHS).execute

p data.sort_by{|r| r[:spread] }.first
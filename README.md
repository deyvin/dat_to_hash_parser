# DatToHash Parser

This project is a Ruby library that parses .dat files with fixed-width columns and transforms them into a hash structure. The module DatToHash provides a flexible way to parse files by specifying the column keys and their respective lengths.

Features

- Parse .dat files with fixed-width columns.
- Convert parsed data into a Ruby hash.
- Easily configurable column keys and lengths.
- Designed to be extensible with various data formats (e.g., soccer data, weather data, etc.).

### Getting Started

Prerequisites

Ensure you have the following installed on your machine:

- Ruby (2.5+)
- Bundler (optional but recommended)

### Installing

1. Clone the repository:

```bash
git clone https://github.com/deyvin/dat_to_hash_parser.git
cd dat_to_hash_parser
```

2. Install dependencies using Bundler:

```bash
bundle install
```

### Running the Parser

You can test the parser by creating a Ruby script that utilizes the Soccer class or any other class that includes the DatToHash module.

### Customizing for Different Data Types

You can customize the parser for different types of .dat files by changing the COLUMN_KEYS and COLUMN_LENGTHS in the class where the DatToHash module is included.

For example, for weather data, you can adjust the class like this:

```ruby
class Weather
  COLUMN_LENGTHS = [4, 5, 4, 4, 7, 5, 5, 4, 5, 5, 4, 3, 4, 3, 3, 2, 6]
  COLUMN_KEYS = [
    :day, :max_temp, :min_temp, :avg_temp, :hdday, :avdp, :one_hr_p,
    :tp_cpn, :wx_type, :p_dir, :av_sp, :dir, :max_s, :sky_c, :max_r, :min_r, :av_slp
  ]

  include DatToHash
end
```

### How it Works

1. Module DatToHash: Handles reading the file, parsing each line according to fixed column lengths, and transforming the data into a hash.
2. Class Inheritance: Classes like Soccer or Weather define specific column lengths and keys, making the parser adaptable to different data formats.
3. Customization: The execute method in each class allows you to parse only the data between specific line numbers, filtering out header or footer information.

### License

This project is licensed under the MIT License. See the LICENSE file for more details.

This README provides an overview of the project, installation instructions, usage examples, and customization options for users who want to adapt the parser to different .dat file formats.

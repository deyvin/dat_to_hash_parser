require 'spec_helper'
require_relative '../lib/soccer'

RSpec.describe Soccer do
  let(:file_path) { 'data/soccer.dat' }
  let(:soccer) { Soccer.new(file_path: file_path) }


  describe '#execute' do
    it 'parses the file and return a object array' do
      result = soccer.execute
      expect(result).to be_an(Array)
      expect(result.first).to be_a(Hash)
    end
  end
end
# frozen_string_literal: true

require 'file_parser'

RSpec.describe FileParser do
  subject { described_class.new(file) }
  let(:file) { File.join(Dir.pwd, 'spec', 'fixtures', 'webserver.log') }

  describe '#parse_file_data' do
    it 'parses file data and makes a record for each line' do
      expect(subject.parse_file_data.first).to be_a(Recorder)
    end
  end
end

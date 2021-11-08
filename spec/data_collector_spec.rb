# frozen_string_literal: true

require 'data_collector'

RSpec.describe DataCollector do
  subject { described_class.new(records) }

  let(:records) { [first_record, second_record, third_record] }

  let(:first_record) { instance_double(Recorder, endpoint: '/about/2', ip: '543.910.244.929') }
  let(:second_record) { instance_double(Recorder, endpoint: '/help_page/1', ip: '1 316.433.849.805') }
  let(:third_record) { instance_double(Recorder, endpoint: '/about/2', ip: '543.910.244.929') }

  let(:expected_result) do
    { most_page_views: { '/about/2' => 2, '/help_page/1' => 1 },
      most_unique_page_views: { '/about/2' => 1, '/help_page/1' => 1 } }
  end

  describe 'collect_data' do
    it 'collects the data and returns correct result in a hash format' do
      expect(subject.collect_data).to eq(expected_result)
    end
  end
end

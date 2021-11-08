# frozen_string_literal: true

require 'data_filter/most_page_views'

RSpec.describe DataFilter::MostPageViews do
  subject { described_class }

  let(:records) { [first_record, second_record, third_record] }

  let(:first_record) { instance_double(Recorder, endpoint: '/about/2', ip: '543.910.244.929') }
  let(:second_record) { instance_double(Recorder, endpoint: '/help_page/1', ip: '1 316.433.849.805') }
  let(:third_record) { instance_double(Recorder, endpoint: '/about/2', ip: '543.910.244.929') }

  let(:expected_result) { { '/about/2' => 2, '/help_page/1' => 1 } }

  describe '#collect_filtered_logs' do
    it 'returns ordered list of webpages with most page views' do
      expect(subject.collect_filtered_logs(records)).to eq(expected_result)
    end
  end
end

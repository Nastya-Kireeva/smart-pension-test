# frozen_string_literal: true

require 'printer'

RSpec.describe Printer do
  subject { described_class.new(filtered_logs) }

  let(:filtered_logs) do
    { most_page_views: { '/about/2' => 90, '/contact' => 89, '/index' => 82 },
      most_unique_page_views: { '/help_page/1' => 23, '/contact' => 23, '/home' => 23 } }
  end

  let(:expected_result) do
    <<~STRING
      Most page views:
      /about/2 - 90 page views
      /contact - 89 page views
      /index - 82 page views

      Most unique page views:
      /help_page/1 - 23 unique page views
      /contact - 23 unique page views
      /home - 23 unique page views
    STRING
  end

  describe '#print' do
    it 'prints filtered logs' do
      expect { subject.print }.to output(expected_result).to_stdout
    end
  end
end

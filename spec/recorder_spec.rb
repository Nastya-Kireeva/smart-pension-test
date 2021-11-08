# frozen_string_literal: true

require 'recorder'

RSpec.describe Recorder do
  subject { described_class.new(endpoint, ip) }

  let(:endpoint) { '/about/' }
  let(:ip) { '2 382.335.626.855' }

  describe '#initialize' do
    it 'has a valid endpoint' do
      expect(subject.endpoint).to eq(endpoint)
    end

    it 'has a valid ip' do
      expect(subject.ip).to eq(ip)
    end
  end
end

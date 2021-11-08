# frozen_string_literal: true

class Recorder
  attr_reader :endpoint, :ip

  def initialize(endpoint, ip)
    @endpoint = endpoint
    @ip = ip
  end
end

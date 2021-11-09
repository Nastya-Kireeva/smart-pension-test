# frozen_string_literal: true

class NotALogError < StandardError
  def initialize(error_message = 'Your file is not a log.')
    super
  end
end

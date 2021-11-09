# frozen_string_literal: true

class EmptyFileError < StandardError
  def initialize(error_message = 'Your file is empty.')
    super
  end
end

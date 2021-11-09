# frozen_string_literal: true

class NoFileError < StandardError
  def initialize(error_message = 'The file was not found.')
    super
  end
end

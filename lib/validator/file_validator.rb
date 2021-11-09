# frozen_string_literal: true

module Validator
  class FileValidator
    LOG_EXTENSION = '.log'

    def initialize(file_path)
      @file_path = file_path
    end

    def validate_file
      raise EmptyFileError if File.empty?(file_path)
      raise NoFileError unless File.exist?(file_path)
      raise NotALogError unless File.extname(file_path) == LOG_EXTENSION
    end

    private

    attr_reader :file_path
  end
end

# frozen_string_literal: true

class FileParser
  def initialize(file_path)
    @file_path = file_path
  end

  def parse_file_data
    File.readlines(file_path).map(&method(:create_record))
  end

  private

  attr_reader :file_path

  def create_record(file_line)
    Recorder.new(*file_line.split)
  end
end

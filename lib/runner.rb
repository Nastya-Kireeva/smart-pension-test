# frozen_string_literal: true

class Runner
  def initialize(file_path)
    @file_path = file_path
  end

  def run_logs_filtering
    validate_file
    print_results
  end

  private

  attr_reader :file_path

  def parse_file
    FileParser.new(file_path).parse_file_data
  end

  def collect_data
    DataCollector.new(parse_file).collect_data
  end

  def validate_file
    Validator::FileValidator.new(file_path).validate_file
  end

  def print_results
    Printer.new(collect_data).print
  end
end

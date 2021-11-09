# frozen_string_literal: true

require_relative 'lib/runner'
require_relative 'lib/recorder'
require_relative 'lib/file_parser'
require_relative 'lib/data_collector'
require_relative 'lib/printer'
require_relative 'lib/data_filter/most_page_views'
require_relative 'lib/data_filter/most_unique_page_views'
require_relative 'lib/validator/file_validator'
require_relative 'lib/validator/errors/no_file_error'
require_relative 'lib/validator/errors/empty_file_error'

file_path = ARGV[0]
Runner.new(file_path).run_logs_filtering

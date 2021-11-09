# frozen_string_literal: true

class Printer
  def initialize(filtered_logs)
    @filtered_logs = filtered_logs
  end

  def print
    print_most_page_views
    print_most_unique_page_views
  end

  private

  attr_reader :filtered_logs

  def print_most_page_views
    puts 'Most page views:'
    result = filtered_logs[:most_page_views].map { |endpoint, ip| "#{endpoint} - #{ip} page views" }
    puts result
  end

  def print_most_unique_page_views
    puts "\n"
    puts 'Most unique page views:'
    result = filtered_logs[:most_unique_page_views].map { |endpoint, ip| "#{endpoint} - #{ip} unique page views" }
    puts result
  end
end

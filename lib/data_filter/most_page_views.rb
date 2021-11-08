# frozen_string_literal: true

module DataFilter
  class MostPageViews
    def self.collect_filtered_logs(records)
      grouped_logs = records.group_by(&:endpoint)
      filtered_logs = grouped_logs.map { |endpoint, ip| [endpoint, ip.count] }
      filtered_logs.sort_by { |_endpoint, count| -count }.to_h
    end
  end
end

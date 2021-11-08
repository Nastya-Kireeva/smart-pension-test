# frozen_string_literal: true

module DataFilter
  class MostUniquePageViews
    def self.collect_filtered_logs(records)
      grouped_logs = records.group_by(&:endpoint)
      filtered_logs = grouped_logs.map { |endpoint, ip| [endpoint, ip.uniq(&:ip).count] }
      filtered_logs.sort_by { |_endpoint, count| -count }.to_h
    end
  end
end

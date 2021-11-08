# frozen_string_literal: true

class DataCollector
  def initialize(records)
    @records = records
  end

  def collect_data
    {
      most_page_views: DataFilter::MostPageViews.collect_filtered_logs(records),
      most_unique_page_views: DataFilter::MostUniquePageViews.collect_filtered_logs(records)
    }
  end

  private

  attr_reader :records
end

class TotalStatTableComponent < ViewComponent::Base
  VIEW_LIMIT = 5

  def initialize(stats:, label:)
    @stats = stats.reject { |k, v| k.nil? }
      .sort_by { |k, v| v }
      .reverse
      .first(VIEW_LIMIT)
    @label = label
  end

  def stats_limit_diff
    VIEW_LIMIT - @stats.count
  end
end

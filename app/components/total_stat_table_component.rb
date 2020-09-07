class TotalStatTableComponent < ViewComponent::Base
  VIEW_LIMIT = 5

  def initialize(stats:, label:)
    @stats = stats.sort_by { |k,v| v }.reverse.first(VIEW_LIMIT)
    @label = label
  end
end
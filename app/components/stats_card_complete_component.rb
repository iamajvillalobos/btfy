class StatsCardCompleteComponent < ViewComponent::Base
  with_content_areas :icon

  def initialize(today, yesterday, title)
    @today = today
    @yesterday = yesterday
    @title = title
    @increase_percentage ||= increase_percentage
  end

  def increase_percentage
    increase = @today.size - @yesterday.size
    return 0.0 if increase == 0
    percent = increase.to_f / @yesterday.size * 100
    percent.round(2)
  end

  def badge_class
    if @increase_percentage.negative?
      "badge-soft-danger"
    elsif @increase_percentage == 0.0
      "badge-soft-warning"
    else
      "badge-soft-success"
    end
  end
end

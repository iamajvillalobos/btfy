class CurrentVisitsPerMonthComponent < ViewComponent::Base
  def initialize(user:)
    @user = user
  end

  def visits_count
    timezone = @user.account&.timezone
    current_date = DateTime.now.in_time_zone(timezone)
    last_month = 1.month.ago.in_time_zone(timezone)
    period = last_month..current_date
    @user.link_visits.where(created_at: period).count
  end
end

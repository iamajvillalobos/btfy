# frozen_string_literal: true

class TallyVisitStats
  extend ::LightService::Action

  expects :visits, :unique_visits, :link
  promises :total_visits, :total_unique_visits

  executed do |ctx|
    ctx.total_visits = ctx.visits.group_by_day(:created_at,
      format: "%b %-d",
      time_zone: ctx.link.user.account.timezone
    ).count

    ctx.total_unique_visits = ctx.unique_visits.group_by_day(:created_at,
      format: "%b %-d",
      time_zone: ctx.link.user.account.timezone
    ).count
  end
end


class GetVisitsDataAction
  extend LightService::Action

  expects :events
  promises :visits

  executed do |ctx|
    ctx.visits = ctx.events.group_by_day(:time,
      format: "%b %-d",
      time_zone: ctx.link.user.account.timezone
    ).count
  end
end
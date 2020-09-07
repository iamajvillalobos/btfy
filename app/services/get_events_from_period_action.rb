class GetEventsFromPeriodAction
  extend LightService::Action

  expects :link, :period
  promises :events

  executed do |ctx|
    ctx.events = case ctx.period
    when "day"
      Ahoy::Event.where_props(link_id: ctx.link.id)
        .where(time: Date.today.all_day)
    when "7d"
      Ahoy::Event.where_props(link_id: ctx.link.id)
        .where(time: 1.week.ago.midnight..Time.now)
    when "30d"
      Ahoy::Event.where_props(link_id: ctx.link.id)
        .where(time: 1.month.ago.midnight..Time.now)
    when "60d"
      Ahoy::Event.where_props(link_id: ctx.link.id)
        .where(time: 2.month.ago.midnight..Time.now)
    end
  end
end
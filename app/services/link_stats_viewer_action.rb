class LinkStatsViewerAction
  extend LightService::Action
  expects :link
  promises :unique_visit_count,
    :unique_visit_count_grouped,
    :visit_count,
    :visit_count_grouped,
    :devices,
    :browsers,
    :countries,
    :range

  executed do |ctx|
    range = Time.now.beginning_of_month..Time.now.end_of_month
    events = Ahoy::Event.where_props(link_id: ctx.link.id)
              .where(time: range)
    uniq_events = Ahoy::Event.where(id: events.uniq(&:visit_id).map(&:id))

    ctx.unique_visit_count = events.distinct.pluck(:visit_id).count
    ctx.visit_count = events.pluck(:visit_id).count
    ctx.devices = uniq_events.map { |e| e.visit.device_type }.tally
    ctx.browsers = uniq_events.map { |e| e.visit.browser }.tally
    ctx.countries = uniq_events.map { |e| e.visit.country }.tally

    ctx.visit_count_grouped = events.group_by_day_of_month(
      :time, range: range
    ).count

    ctx.unique_visit_count_grouped = uniq_events.group_by_day_of_month(
      :time, range: range
    ).count

    ctx.range = range
  end
end

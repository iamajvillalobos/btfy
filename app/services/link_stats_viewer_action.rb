class LinkStatsViewerAction
  extend LightService::Action
  expects :link, :period
  promises :unique_visit_count,
    :unique_visit_count_grouped,
    :visit_count,
    :visit_count_grouped,
    :devices,
    :browsers,
    :countries,
    :cities,
    :referrers,
    :range,
    :os

  executed do |ctx|
    range = Time.now.beginning_of_month..Time.now.end_of_month
    events = Ahoy::Event.where_props(link_id: ctx.link.id)
              .where(time: range)
    uniq_events = Ahoy::Event.where(id: events.uniq(&:visit_id).map(&:id))

    ctx.unique_visit_count = events.distinct.pluck(:visit_id).count

    ctx.visit_count = events.pluck(:visit_id).count

    ctx.devices = tally_and_clean(events.map { |e| e.visit.device_type })

    ctx.browsers = tally_and_clean(events.map { |e| e.visit.browser })

    ctx.os = tally_and_clean(events.map { |e| e.visit.os })

    ctx.countries = events.map do |e|
      next unless e.visit.country
      country = ISO3166::Country.new(e.visit.country)
      case country.name
      when "United States of America"
        "#{country.emoji_flag} USA"
      when "United Kingdom of Great Britain and Northern Ireland"
        "#{country.emoji_flag} UK"
      when "United Arab Emirates"
        "#{country.emoji_flag} UAE"
      when "Korea (Republic of)"
        "#{country.emoji_flag} South Korea"
      else
        "#{country.emoji_flag} #{country.name}"
      end
    end
    ctx.countries = tally_and_clean(ctx.countries)

    ctx.cities = tally_and_clean(events.map { |e| e.visit.city })

    ctx.referrers = GetLinkReferrerDataAction.execute(ahoy_events: events).referrers

    ctx.visit_count_grouped = events.group_by_day_of_month(
      :time, range: range
    ).count

    ctx.unique_visit_count_grouped = uniq_events.group_by_day_of_month(
      :time, range: range
    ).count

    ctx.range = range
  end

  def self.tally_and_clean(data)
    data.tally.delete_if { |k, v| k.nil? }
  end
end


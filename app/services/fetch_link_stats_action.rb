class FetchLinkStatsAction
  include LightService::Action

  expects :links, :period
  promises :links_with_stats

  executed do |ctx|
    events = case ctx.period
                when "day"
                  Ahoy::Event.where(time: Date.today.all_day)
                when "7d"
                  Ahoy::Event.where(time: 1.week.ago.midnight..Time.now)
                when "30d"
                  Ahoy::Event.where(time: 1.month.ago.midnight..Time.now)
                when "60d"
                  Ahoy::Event.where(time: 1.month.ago.midnight..Time.now)
                else
                  Ahoy::Event.where(time: Date.today.all_day)
    end

    event_link_ids = events.group_by { |e|
      e.properties["link_id"]
    }.map { |key, val| key }

    current_user_links = ctx.links.pluck(:id)
    current_user_link_ids = event_link_ids.select { |el|
      current_user_links.include? el
    }

    links = Link.where(id: current_user_link_ids)

    ctx.links_with_stats = links.map { |link| GetLinkStats.call(link, ctx.period) }
  end
end

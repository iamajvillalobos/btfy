class GetTopLinksAction
  include LightService::Action

  expects :user, :period
  promises :top_links

  LIMIT = 5

  executed do |ctx|
    links = ctx.user.links.map do |link|
      GetEventsFromPeriodAction.execute(link: link, period: ctx.period)
    end

    sorted = links.sort_by do |link|
      link.events.count
    end

    ctx.top_links = sorted.reverse.first(LIMIT)
  end
end

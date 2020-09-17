class FetchLinkStatsAction
  include LightService::Action

  expects :links, :period
  promises :links_with_stats

  executed do |ctx|
    ctx.links_with_stats = ctx.links.map { |link|
      GetVisitStats.call(link, ctx.period)
    }
  end
end

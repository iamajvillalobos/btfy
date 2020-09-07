class FetchLinkStatsAction
  include LightService::Action

  expects :links, :range
  promises :links_with_stats

  executed do |ctx|
    ctx.links_with_stats = ctx.links.where(created_at: ctx.range).map do |link|
      LinkStatsViewerAction.execute(link: link)
    end
  end
end
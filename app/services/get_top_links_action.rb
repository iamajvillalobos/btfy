class GetTopLinksAction
  include LightService::Action

  expects :user
  promises :top_links

  LIMIT = 5

  executed do |ctx|
    sorted_links = ctx.user.links.map { |link|
      LinkStatsViewerAction.execute(link: link)
    }.sort_by { |link|
      link.visit_count
    }.reverse!.first(LIMIT)

    link_ids = sorted_links.map { |l| l[:link].id }

    ctx.top_links = link_ids.map { |id| Link.find(id) }
  end
end

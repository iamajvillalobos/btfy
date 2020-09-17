class GetTopLinksAction
  include LightService::Action

  expects :links_with_stats
  promises :top_links

  LIMIT = 5

  executed do |ctx|
    sorted = ctx.links_with_stats.sort_by do |link|
      link.visits.count
    end

    ctx.top_links = sorted.select { |s| s.visits.count > 0 }.reverse.first(LIMIT)
  end
end

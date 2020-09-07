class FetchTotalVisitCountAction
  include LightService::Action

  expects :links_with_stats
  promises :total_visit_count

  executed do |ctx|
    ctx.total_visit_count = ctx.links_with_stats.sum(&:visit_count)
  end
end

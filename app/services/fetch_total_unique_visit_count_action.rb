class FetchTotalUniqueVisitCountAction
  include LightService::Action

  expects :links_with_stats
  promises :total_unique_visit_count

  executed do |ctx|
    ctx.total_unique_visit_count = ctx.links_with_stats.sum(&:unique_visit_count)
  end
end

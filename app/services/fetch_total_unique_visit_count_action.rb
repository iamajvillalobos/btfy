class FetchTotalUniqueVisitCountAction
  include LightService::Action

  expects :links, :range
  promises :total_unique_visit_count

  executed do |ctx|
    count = 0

    ctx.links.where(created_at: ctx.range).find_each do |link|
      count += LinkStatsViewerAction.execute(link: link).unique_visit_count
    end

    ctx.total_unique_visit_count = count
  end
end

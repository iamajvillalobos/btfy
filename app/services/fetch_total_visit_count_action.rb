class FetchTotalVisitCountAction
  include LightService::Action

  expects :links, :range
  promises :total_visit_count

  executed do |ctx|
    count = 0

    ctx.links.where(created_at: ctx.range).find_each do |link|
      count += LinkStatsViewerAction.execute(link: link).visit_count
    end

    ctx.total_visit_count = count
  end
end

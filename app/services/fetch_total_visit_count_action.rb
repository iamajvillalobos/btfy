class FetchTotalVisitCountAction
  include LightService::Action

  expects :links_with_stats
  promises :total_visits

  executed do |ctx|
    visits = {}

    ctx.links_with_stats.each do |link|
      visit = link.visits
      visits.merge!(visit) { |_, old_val, new_val| old_val + new_val }
    end

    ctx.total_visits = visits
  end
end

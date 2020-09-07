class FetchTotalReferrersAction
  include LightService::Action
  
  expects :links_with_stats
  promises :total_referrers

  executed do |ctx|
    referrers = {}

    ctx.links_with_stats.each do |link|
      referrer = link.referrers
      referrers.merge!(referrer) { |_, old_val, new_val| old_val + new_val }
    end

    ctx.total_referrers = referrers
  end
end
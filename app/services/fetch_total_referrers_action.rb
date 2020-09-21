class FetchTotalReferrersAction
  include LightService::Action
  
  expects :links_with_stats
  promises :total_referrers, :total_unique_referrers

  executed do |ctx|
    referrers = {}
    unique_referrers = {}

    ctx.links_with_stats.each do |link|
      referrer = link.referrers
      unique_referrer = link.unique_referrers

      referrers.merge!(referrer) { |_, old_val, new_val| old_val + new_val }
      unique_referrers.merge!(unique_referrer) { |_, old_val, new_val| old_val + new_val }
    end

    ctx.total_referrers = referrers
    ctx.total_unique_referrers = unique_referrers
  end
end

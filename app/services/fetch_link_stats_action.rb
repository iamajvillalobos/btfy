class FetchLinkStatsAction
  include LightService::Action

  expects :links, :period
  promises :links_with_stats

  executed do |ctx|
    links = case ctx.period
      when "day"
        ctx.links.where(created_at: Date.today.all_day)
      when "7d"
        ctx.links.where(created_at: 1.week.ago.midnight..Time.now)
      when "30d"
        ctx.links.where(created_at: 1.month.ago.midnight..Time.now)
      when "60d"
        ctx.links.where(created_at: 1.month.ago.midnight..Time.now)
      else
        ctx.links.where(created_at: Date.today.all_day)
      end
      
    ctx.links_with_stats = links.map { |link| GetLinkStats.call(link, ctx.period) }
  end
end
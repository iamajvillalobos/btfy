class FetchTotalBrowsersCountAction
  include LightService::Action

  expects :links, :range
  promises :total_browsers

  executed do |ctx|
    browsers = {}

    ctx.links.where(created_at: ctx.range).find_each do |link|
      browser = LinkStatsViewerAction.execute(link: link).browsers
      browsers.merge!(browser) { |_, old_val, new_val| old_val + new_val }
    end

    ctx.total_browsers = browsers.sort
  end
end

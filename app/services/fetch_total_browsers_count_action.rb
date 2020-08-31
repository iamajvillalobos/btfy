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

    # Todo: Found out why there is a nil browser accesing the link
    ctx.total_browsers = browsers.keys.delete_if { |k, v| k.nil? }.sort
  end
end

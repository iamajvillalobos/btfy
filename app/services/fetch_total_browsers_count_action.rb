class FetchTotalBrowsersCountAction
  include LightService::Action

  expects :links_with_stats
  promises :total_browsers

  executed do |ctx|
    browsers = {}
    
    ctx.links_with_stats.each do |link|
      browser = link.browsers
      browsers.merge!(browser) { |_, old_val, new_val| old_val + new_val }
    end

    # Todo: Found out why there is a nil browser accesing the link
    ctx.total_browsers = browsers
  end
end

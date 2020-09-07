class GetBrowsersDataAction
  extend LightService::Action

  expects :events
  promises :browsers

  executed do |ctx|
    browsers = ctx.events.map { |e| e.visit.browser }
    ctx.browsers = browsers.tally.delete_if { |k, v| k.nil? }
  end
end
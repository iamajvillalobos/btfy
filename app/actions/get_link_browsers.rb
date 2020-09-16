# frozen_string_literal: true

class GetLinkBrowsers
  extend ::LightService::Action

  expects :unique_visits
  promises :browsers

  executed do |ctx|
    ctx.browsers = ctx.unique_visits.map { |uv| uv.browser }.tally
  end
end

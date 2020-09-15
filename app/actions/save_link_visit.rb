# frozen_string_literal: true

class SaveLinkVisit
  extend ::LightService::Action

  expects :visitor_hash, :browser, :device_type, :country, :referrer, :link

  executed do |ctx|
    ctx.link.visits.create!(
      visitor_hash: ctx.visitor_hash,
      browser: ctx.browser,
      device_type: ctx.device_type,
      country: ctx.country,
      referrer: ctx.referrer
    )
  end
end

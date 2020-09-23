# frozen_string_literal: true

class SaveLinkVisit
  extend ::LightService::Action

  expects :visitor_hash, :browser, :device_type, :referrer, :link, :user
  promises :visit

  executed do |ctx|
    ctx.visit = ctx.link.visits.create!(
      visitor_hash: ctx.visitor_hash,
      browser: ctx.browser,
      device_type: ctx.device_type,
      referrer: ctx.referrer,
      user: ctx.user
    )
  end
end

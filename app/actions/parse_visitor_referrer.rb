# frozen_string_literal: true

class ParseVisitorReferrer
  extend ::LightService::Action

  expects :request
  promises :referrer

  executed do |ctx|
    ctx.referrer = ReferrerDomain.new(url: ctx.request.referrer).name
  end
end

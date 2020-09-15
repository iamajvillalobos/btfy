# frozen_string_literal: true

class ParseVisitorReferrer
  extend ::LightService::Action

  expects :request
  promises :referrer

  executed do |ctx|
    ctx.referrer = ctx.request.referrer
  end
end

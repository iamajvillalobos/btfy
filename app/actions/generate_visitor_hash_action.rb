# frozen_string_literal: true

class GenerateVisitorHashAction
  extend ::LightService::Action

  expects :request
  promises :visitor_hash

  executed do |ctx|
    data = [
      ctx.request.referrer,
      ctx.request.ip,
      ctx.request.env["HTTP_USER_AGENT"]
    ].join

    ctx.visitor_hash = OpenSSL::HMAC.hexdigest(
      "SHA256",
      Salt.first.key,
      data
    )
  end
end

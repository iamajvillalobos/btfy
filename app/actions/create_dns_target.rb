# frozen_string_literal: true

class CreateDnsTarget
  extend ::LightService::Action

  expects :domain

  executed do |ctx|
    heroku = PlatformAPI.connect_oauth(ENV["HEROKU_TOKEN"])
    body = {
      hostname: ctx.domain.name
    }
    response = heroku.domain.create(ENV["HEROKU_APP_NAME"], body)
    dns_response = OpenStruct.new(response)
    ctx.domain.dns_target = dns_response.cname
  end
end

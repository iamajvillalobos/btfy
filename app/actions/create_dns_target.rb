# frozen_string_literal: true

class CreateDnsTarget
  extend ::LightService::Action

  expects :domain

  executed do |ctx|
    url = "https://api.heroku.com/apps/#{ENV["HEROKU_APP_NAME"]}/domains"
    options = {
      body: {
        hostname: ctx.domain.name
      },
      headers: {
        "Accept": "application/vnd.heroku+json; version=3",
        "Authorization": "Basic #{ENV["HEROKU_API_KEY"]}"
      }
    }
    response = HTTParty.post(url, options)

    if response.success?
      dns_response = OpenStruct.new(response.parsed_response)
      ctx.domain.dns_target = dns_response.cname
      ctx.domain.status = dns_response.status
    else
      ctx.fail_and_return!(response.message)
    end
  end
end

# frozen_string_literal: true

class ParseVisitorCountry
  extend ::LightService::Action

  expects :request
  promises :country

  executed do |ctx|
    ip = ctx.request.remote_ip
    url = "http://api.ipstack.com/#{ip}?access_key=#{ENV['IPSTACK_API_KEY']}"
    response = ::HTTParty.get(url)

    ctx.country = response["country_name"]
  end
end

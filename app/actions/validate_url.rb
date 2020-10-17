# frozen_string_literal: true

class ValidateUrl
  extend ::LightService::Action

  expects :link
  promises :status

  executed do |ctx|
    url = ctx.link.destination_url
    response = HTTParty.get(url)

    if response.code == 200
      ctx.status = :success
    else
      ctx.status = :failed
    end
  rescue SocketError => e
    ctx.status = :failed
  end
end

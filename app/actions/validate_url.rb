# frozen_string_literal: true

class ValidateUrl
  extend ::LightService::Action

  expects :link
  promises :status

  executed do |ctx|
    response = HTTParty.get(ctx.link.destination_url)

    if response.code == 200
      ctx.status = :success
    else
      ctx.status = :failed
    end
  rescue SocketError => e
    ctx.status = :failed
  end
end

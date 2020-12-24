# frozen_string_literal: true

class ValidateUrl
  extend ::LightService::Action

  expects :link
  promises :status

  executed do |ctx|
    url = ctx.link.destination_url

    # replace https with http
    url.gsub!("https", "http")

    response = HTTP.get(url)

    ctx.status = unless response.code == 404
                   :success
                 else
                   :failed
                 end
  rescue SocketError => e
    ctx.status = :failed
  rescue OpenSSL::SSL::SSLError
    ctx.status = :failed
  end
end

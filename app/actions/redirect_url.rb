# frozen_string_literal: true

class RedirectUrl
  extend ::LightService::Action

  expects :link, :status
  promises :url

  executed do |ctx|
    ctx.url = if ctx.status == :success
      ctx.link.destination_url
    else
      if ctx.link.custom_domain
        ctx.link.custom_domain.not_found_url
      else
        "/404"
      end
    end
  end
end

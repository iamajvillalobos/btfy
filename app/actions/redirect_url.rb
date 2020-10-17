# frozen_string_literal: true

class RedirectUrl
  extend ::LightService::Action

  expects :link, :status
  promises :redirect_url

  executed do |ctx|
    ctx.redirect_url = if ctx.status == :success
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

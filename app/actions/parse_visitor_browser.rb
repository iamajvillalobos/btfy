# frozen_string_literal: true

class ParseVisitorBrowser
  extend ::LightService::Action

  expects :device
  promises :browser

  executed do |ctx|
    ctx.browser = ctx.device.name
  end
end

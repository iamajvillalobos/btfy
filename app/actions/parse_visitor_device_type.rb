# frozen_string_literal: true

class ParseVisitorDeviceType
  extend ::LightService::Action

  expects :device
  promises :device_type

  executed do |ctx|
    ctx.device_type = ctx.device.device_type
  end
end

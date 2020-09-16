# frozen_string_literal: true

class ParseVisitorDeviceType
  extend ::LightService::Action

  expects :device
  promises :device_type

  executed do |ctx|
    device_type = case ctx.device.device_type
    when "smartphone"
      "Mobile"
    when "tv"
      "TV"
    when "phablet"
      "Tablet"
    else
      ctx.device.device_type.try(:titleize)
    end
    ctx.device_type = device_type
  end
end

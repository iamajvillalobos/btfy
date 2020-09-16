class InitializeVisitorDevice
  extend ::LightService::Action

  expects :request
  promises :device

  executed do |ctx|
    ctx.device = DeviceDetector.new(ctx.request.user_agent)
    if ctx.device.bot? || (ctx.device.device_type.nil? && ctx.device.os_name.nil?)
      ctx.fail_and_return!
    end
  end
end

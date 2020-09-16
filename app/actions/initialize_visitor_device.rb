class InitializeVisitorDevice
  extend ::LightService::Action

  expects :request
  promises :device

  executed do |ctx|
    ctx.device = DeviceDetector.new(ctx.request.user_agent)
  end
end

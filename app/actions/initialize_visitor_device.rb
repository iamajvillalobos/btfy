class InitializeVisitorDevice
  extend ::LightService::Action

  expects :request
  promises :device

  executed do |ctx|
    ctx.device = DeviceDetector.new(ctx.request.env["HTTP_USER_AGENT"])
  end
end

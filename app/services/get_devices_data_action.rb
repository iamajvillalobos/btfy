class GetDevicesDataAction
  extend LightService::Action

  expects :events
  promises :devices

  executed do |ctx|
    devices = ctx.events.map do |event|
      if event.visit.device_type == "Phablet"
        "Tablet"
      else
        event.visit.device_type
      end
    end

    ctx.devices = devices.tally.delete_if { |k, v| k.nil? }
  end
end
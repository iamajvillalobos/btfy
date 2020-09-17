class FetchTotalDevicesCountAction
  include LightService::Action

  expects :links_with_stats
  promises :total_devices

  executed do |ctx|
    devices = {}

    ctx.links_with_stats.each do |link|
      device = link.device_types
      devices.merge!(device) do |_, old_val, new_val|
        old_val + new_val
      end
    end

    ctx.total_devices = devices
  end
end

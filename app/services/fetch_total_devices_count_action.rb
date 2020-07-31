class FetchTotalDevicesCountAction
  include LightService::Action

  expects :links, :range
  promises :total_devices

  executed do |ctx|
    devices = {}

    ctx.links.where(created_at: ctx.range).find_each do |link|
      device = LinkStatsViewerAction.execute(link: link).devices
      devices.merge!(device) { |_, old_val, new_val| old_val + new_val }
    end

    ctx.total_devices = devices.sort
  end
end

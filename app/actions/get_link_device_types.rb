# frozen_string_literal: true

class GetLinkDeviceTypes
  extend ::LightService::Action

  expects :unique_visits
  promises :device_types

  executed do |ctx|
    ctx.device_types = ctx.unique_visits.map { |uv| uv.device_type }.tally
  end
end

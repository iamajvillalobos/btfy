# frozen_string_literal: true

class GetLinkUniqueVisits
  extend ::LightService::Action

  expects :visits
  promises :unique_visits

  executed do |ctx|
    ctx.unique_visits = ctx.visits.select(:visitor_hash).distinct
  end
end

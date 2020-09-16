# frozen_string_literal: true

class GetLinkUniqueVisits
  extend ::LightService::Action

  expects :visits
  promises :unique_visits

  executed do |ctx|
    unique_visit_ids = ctx.visits.uniq(&:visitor_hash).pluck(:id)
    ctx.unique_visits = LinkVisit.where(id: unique_visit_ids)
  end
end

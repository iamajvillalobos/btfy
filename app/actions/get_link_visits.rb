# frozen_string_literal: true

class GetLinkVisits
  extend ::LightService::Action

  expects :link, :period
  promises :visits

  executed do |ctx|
    ctx.visits = case ctx.period
    when "7d"
      ctx.link.visits.where(created_at: 1.week.ago.midnight..Time.now)
    when "30d"
      ctx.link.visits.where(created_at: 1.month.ago.midnight..Time.now)
    else
      ctx.link.visits.where(created_at: 1.week.ago.midnight..Time.now)
    end
  end
end


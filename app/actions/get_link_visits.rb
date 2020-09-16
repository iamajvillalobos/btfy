# frozen_string_literal: true

class GetLinkVisits
  extend ::LightService::Action

  expects :link, :period
  promises :visits

  executed do |ctx|
    ctx.visits = case ctx.period
    when "day"
      ctx.link.visits.where(created_at: Date.today.all_day)
    when "7d"
      ctx.link.visits.where(created_at: 1.week.ago.midnight..Time.now)
    when "30d"
      ctx.link.visits.where(created_at: 1.month.ago.midnight..Time.now)
    when "60d"
      ctx.link.visits.where(created_at: 2.month.ago.midnight..Time.now)
    end
  end
end


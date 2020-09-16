# frozen_string_literal: true

class ParseVisitorCountry
  extend ::LightService::Action

  expects :request, :visit

  executed do |ctx|
    ip = ctx.request.remote_ip
    CountryLookupJob.perform_later(ip, ctx.visit.id)
  end
end

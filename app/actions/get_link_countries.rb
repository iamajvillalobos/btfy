# frozen_string_literal: true

class GetLinkCountries
  extend ::LightService::Action

  expects :unique_visits
  promises :countries

  executed do |ctx|
    ctx.countries = ctx.unique_visits.map { |uv| uv.country }.tally
  end
end

# frozen_string_literal: true

class GetLinkReferrers
  extend ::LightService::Action

  expects :unique_visits
  promises :referrers

  REFERRER_MAP = {
    "l.facebook.com" => "Facebook",
    "m.facebook.com" => "Facebook",
    "www.facebook.com" => "Facebook",
  }

  executed do |ctx|
    ctx.referrers = ctx.unique_visits.map { |uv| parse(uv.referrer) }.tally
  end

  def self.parse(referrer)
    return "Unknown" if referrer.nil?
    key = Addressable::URI.parse(referrer).host
    return referrer unless REFERRER_MAP.key?(key)
    REFERRER_MAP[key]
  end
end

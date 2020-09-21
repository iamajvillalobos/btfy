# frozen_string_literal: true

class GetLinkReferrers
  extend ::LightService::Action

  expects :unique_visits, :visits
  promises :unique_referrers, :referrers

  REFERRER_MAP = {
    "l.facebook.com" => "Facebook",
    "m.facebook.com" => "Facebook",
    "www.facebook.com" => "Facebook",
  }

  executed do |ctx|
    ctx.referrers = ctx.visits.map { |uv| parse(uv.referrer) }.tally
    ctx.unique_referrers = ctx.unique_visits.map { |uv| parse(uv.referrer) }.tally
  end

  def self.parse(referrer)
    return "Direct / None" if referrer.nil?
    key = Addressable::URI.parse(referrer).host
    return referrer unless REFERRER_MAP.key?(key)
    REFERRER_MAP[key]
  end
end

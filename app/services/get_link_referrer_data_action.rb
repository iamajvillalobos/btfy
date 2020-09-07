class GetLinkReferrerDataAction
  include LightService::Action

  expects :ahoy_events
  promises :referrers

  executed do |ctx|
    referrers = ctx.ahoy_events.map do |event|
      # event.visit.referring_domain ? event.visit.referring_domain : "Direct"

      ReferrerDomain.new(url: event.visit.referring_domain).name
    end

    ctx.referrers = referrers.tally
  end
end
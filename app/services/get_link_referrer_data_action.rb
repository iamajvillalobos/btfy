class GetLinkReferrerDataAction
  include LightService::Action

  expects :events
  promises :referrers

  executed do |ctx|
    referrers = ctx.events.map do |event|
      ReferrerDomain.new(url: event.visit.referring_domain).name
    end

    ctx.referrers = referrers.tally
  end
end
class LinkFinder
  extend LightService::Organizer

  def self.call(request, slug, ahoy)
    with(
      request: request,
      slug: slug,
      ahoy: ahoy
    ).reduce(
      ParseRequestParamsAction,
      VerifyDomainAction,
      VerifySlugAction,
      AddLinkAnalyticsAction
    )
  end
end

class LinkFinder
  extend LightService::Organizer

  def self.call(request, slug)
    with(
      request: request,
      slug: slug
    ).reduce(
      ParseRequestParamsAction,
      VerifyDomainAction,
      VerifySlugAction,
      reduce_if(->(ctx) { ctx.success? && !ctx.link.no_tracking? }, [
        AddVisitInformation
      ])
    )
  end
end

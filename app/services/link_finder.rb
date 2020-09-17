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
      reduce_if(->(ctx) { ctx.success? }, [
        AddVisitInformation
      ])
    )
  end
end

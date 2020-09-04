class CreateLink
  extend LightService::Organizer

  def self.call(link)
    with(
      link: link
    ).reduce(
      GenerateLinkNameAction,
      GenerateAvailableSlugAction,
      AssociateToCustomDomainAction,
      SaveLinkAction
    )
  end
end

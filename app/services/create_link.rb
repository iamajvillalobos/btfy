class CreateLink
  extend LightService::Organizer

  def self.call(link)
    with(
      link: link
    ).reduce(
      GenerateLinkNameAction,
      GenerateAvailableSlugAction,
      SaveLinkAction
    )
  end
end

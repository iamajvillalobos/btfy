class CreateCustomDomain
  extend LightService::Organizer

  def self.call(domain)
    with(
      domain: domain
    ).reduce(
      ValidateDomainNameAction,
      SaveDomainAction
    )
  end
end

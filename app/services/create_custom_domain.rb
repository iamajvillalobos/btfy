class CreateCustomDomain
  extend LightService::Organizer

  def self.call(domain)
    with(
      domain: domain
    ).reduce(
      ValidateDomainNameAction,
      CheckDomainConnectionAction,
      SaveDomainAction
    )
  end
end

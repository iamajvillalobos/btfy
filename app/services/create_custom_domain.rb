class CreateCustomDomain
  extend LightService::Organizer

  def self.call(domain)
    with(
      domain: domain
    ).reduce(
      ValidateDomainNameAction,
      CreateDnsTarget,
      SaveDomainAction
    )
  end
end

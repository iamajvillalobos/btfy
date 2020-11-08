# frozen_string_literal: true

class DeleteCustomDomain
  extend ::LightService::Organizer

  def self.call(custom_domain)
    with(
      custom_domain: custom_domain
    ).reduce(actions)
  end

  def self.actions
    [
      DeleteCustomDomainRecord,
      DeleteDnsEntry
    ]
  end
end

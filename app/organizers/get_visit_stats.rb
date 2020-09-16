# frozen_string_literal: true

class GetVisitStats
  extend ::LightService::Organizer

  def self.call(link, period)
    with(
      link: link,
      period: period
    ).reduce(actions)
  end

  def self.actions
    [
      ::GetLinkVisits,
      ::GetLinkUniqueVisits,
      ::GetLinkCountries,
      ::GetLinkDeviceTypes,
      ::TallyVisitStats
    ]
  end
end

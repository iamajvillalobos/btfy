# frozen_string_literal: true

class AddVisitInformation
  extend ::LightService::Organizer

  def self.call(params)
    with(
      request: params.request,
      link: params.link
    ).reduce(actions)
  end

  def self.actions
    [
      ::GenerateVisitorHashAction,
      ::InitializeVisitorDevice,
      ::ParseVisitorBrowser,
      ::ParseVisitorDeviceType,
      ::ParseVisitorCountry,
      ::ParseVisitorReferrer,
      ::SaveLinkVisit
    ]
  end
end

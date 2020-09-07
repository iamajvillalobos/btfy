class GetLinkStats
  extend LightService::Organizer

  def self.call(link, period)
    with(
      link: link,
      period: period
    ).reduce(
      GetEventsFromPeriodAction,
      GetLinkReferrerDataAction,
      GetDevicesDataAction,
      GetBrowsersDataAction,
      GetCountriesDataAction,
    )
  end
end
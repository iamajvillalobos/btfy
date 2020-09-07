class GroupLinkStatsViewer
  include LightService::Organizer

  def self.call(links, period)
    with(
      links: links,
      period: period
    ).reduce(
      FetchLinkStatsAction,
      FetchTotalVisitCountAction,
      FetchTotalBrowsersCountAction,
      FetchTotalDevicesCountAction,
      FetchTotalReferrersAction,
      FetchTotalCountriesAction
    )
  end
end

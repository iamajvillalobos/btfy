class GroupLinkStatsViewer
  include LightService::Organizer

  def self.call(links, period)
    with(
      links: links,
      period: period
    ).reduce(
      FetchLinkStatsAction,
      FetchTotalVisitCountAction,
      FetchTotalUniqueVisitsCountAction,
      FetchTotalBrowsersCountAction,
      FetchTotalDevicesCountAction,
      FetchTotalReferrersAction,
      FetchTotalCountriesAction,
      GetTopLinksAction
    )
  end
end

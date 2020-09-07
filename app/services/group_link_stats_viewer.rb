class GroupLinkStatsViewer
  include LightService::Organizer

  def self.call(links)
    with(
      links: links,
      range: Time.now.last_month..Time.now
    ).reduce(
      FetchLinkStatsAction,
      FetchTotalUniqueVisitCountAction,
      FetchTotalVisitCountAction,
      FetchTotalBrowsersCountAction,
      FetchTotalDevicesCountAction
    )
  end
end

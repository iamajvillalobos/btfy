class GroupLinkStatsViewer
  include LightService::Organizer

  def self.call(links)
    with(
      links: links,
      range: Time.now.last_month..Time.now
    ).reduce(
      FetchTotalUniqueVisitCountAction,
      FetchTotalVisitCountAction,
      FetchTotalBrowsersCountAction,
      FetchTotalDevicesCountAction
    )
  end
end

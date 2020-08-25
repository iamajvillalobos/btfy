class DashboardController < ApplicationController
  before_action :authenticate_user!

  layout "dashboard"

  def show
    @links = GetTopLinksAction.execute(user: current_user).top_links
    @stats = GroupLinkStatsViewer.call(current_user.links)
  end
end

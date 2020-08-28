class DashboardsController < ApplicationController
  layout "dashboard"

  before_action :authenticate_user!

  def show
    @links = GetTopLinksAction.execute(user: current_user).top_links
    @stats = GroupLinkStatsViewer.call(current_user.links)
  end
end

class DashboardController < ApplicationController
  before_action :authenticate_user!

  layout "dashboard"

  def show
    @links = current_user.links.limit(5)
    @stats = GroupLinkStatsViewer.call(@links)
  end
end

class DashboardController < ApplicationController
  before_action :authenticate_user!

  layout "dashboard"

  def show
    @links = current_user.links.order(created_at: :desc)
    @stats = GroupLinkStatsViewer.call(@links)
  end
end

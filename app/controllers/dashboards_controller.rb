class DashboardsController < ApplicationController
  layout "dashboard"

  before_action :authenticate_user!

  def show
    authorize! :read, :dashboard

    @stats = if params[:period].present?
      GroupLinkStatsViewer.call(current_user.links, params[:period])
    else
      GroupLinkStatsViewer.call(current_user.links, "30d")
    end
  end
end

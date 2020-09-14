class DashboardsController < ApplicationController
  layout "dashboard"

  before_action :authenticate_user!

  def show
    if current_user.free_plan?
      redirect_to links_path
      return
    end

    authorize! :read, :dashboard

    @stats = if params[:period].present?
      GroupLinkStatsViewer.call(current_user.links, params[:period])
    else
      GroupLinkStatsViewer.call(current_user.links, "30d")
    end
  end
end

class DashboardsController < ApplicationController
  layout "dashboard"

  before_action :authenticate_user!

  def show
    if current_user.free_plan?
      redirect_to links_path
      return
    end

    authorize! :read, :dashboard

    if params[:period].present?
      @stats = GroupLinkStatsViewer.call(current_user.links, params[:period])
      @links = GetTopLinksAction.execute(user: current_user, period: params[:period])
        .top_links
    else
      @links = GetTopLinksAction.execute(user: current_user, period: "30d").top_links
      @stats = GroupLinkStatsViewer.call(current_user.links, "30d")
    end
  end
end

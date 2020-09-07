class DashboardsController < ApplicationController
  layout "dashboard"

  before_action :authenticate_user!

  def show
    if current_user.free_plan?
      redirect_to links_path
      return
    end

    authorize! :read, :dashboard
    @links = GetTopLinksAction.execute(user: current_user).top_links
    @stats = GroupLinkStatsViewer.call(current_user.links)
  end
end

class Admin::LinksController < ApplicationController
  layout "admin"

  before_action :authenticate_admin_user!

  def index
    @links = Link.order(created_at: :desc).first(20)
    @stats = GroupLinkStatsViewer.call(Link.all, "30d")
  end
end

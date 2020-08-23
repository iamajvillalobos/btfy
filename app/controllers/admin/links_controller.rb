class Admin::LinksController < ApplicationController
  layout "admin"

  before_action :authenticate_admin_user!

  def index
    @pagy, @links = pagy(Link.order(created_at: :desc), items: 10)
  end
end

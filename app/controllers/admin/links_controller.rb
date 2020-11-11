class Admin::LinksController < ApplicationController
  layout "admin"

  before_action :authenticate_admin_user!
  skip_authorization_check

  def index
    @pagy, @links = pagy(Link.order(created_at: :desc))
  end
end

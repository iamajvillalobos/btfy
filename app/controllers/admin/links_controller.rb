class Admin::LinksController < ApplicationController
  layout "admin"

  before_action :authenticate_admin_user!

  def index
    @links = Link.order(created_at: :desc)
  end
end

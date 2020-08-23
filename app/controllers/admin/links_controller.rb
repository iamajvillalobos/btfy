class Admin::LinksController < ApplicationController
  layout "admin"

  def index
    @pagy, @links = pagy(Link.order(created_at: :desc))
  end
end

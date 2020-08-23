class Admin::LinksController < ApplicationController
  layout "admin"

  def index
    @pagy, @links = pagy(Link.order(created_at: :desc), items: 10)
  end
end

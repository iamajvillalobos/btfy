class Admin::LinksController < ApplicationController
  layout "admin"
  
  def index
    @links = Link.order(created_at: :desc)
  end
end

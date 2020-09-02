class BiosController < ApplicationController
  before_action :authenticate_user!

  layout "dashboard"

  def show
    @pagy, @links = pagy(current_user.links.order(created_at: :desc), items: 10)
  end
end
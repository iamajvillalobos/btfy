class BiosController < ApplicationController
  before_action :authenticate_user!

  layout "dashboard"

  def show
    @pagy, @links = pagy(current_user.links.order(public_profile_id: :asc), items: 25)
  end
end
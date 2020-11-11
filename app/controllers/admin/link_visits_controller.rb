class Admin::LinkVisitsController < ApplicationController
  layout "admin"

  before_action :authenticate_admin_user!
  skip_authorization_check

  def index
    @pagy, @link_visits = pagy(LinkVisit.order(created_at: :desc))
  end
end

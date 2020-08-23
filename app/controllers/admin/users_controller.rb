class Admin::UsersController < ApplicationController
  layout "admin"

  before_action :authenticate_admin_user!

  def index
    @pagy, @users = pagy(User.order(created_at: :desc), items: 10)
  end
end

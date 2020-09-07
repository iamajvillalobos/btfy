class Admin::UsersController < ApplicationController
  layout "admin"

  before_action :authenticate_admin_user!

  def index
    @pagy, @users = pagy(User.order(created_at: :desc), items: 10)
  end

  def impersonate
    user = User.find(params[:id])
    impersonate_user(user)
    redirect_to root_path
  end

  def stop_impersonating
    stop_impersonating_user
    redirect_to root_path
  end
end

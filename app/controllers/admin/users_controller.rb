class Admin::UsersController < ApplicationController
  layout "admin"

  before_action :authenticate_admin_user!
  skip_authorization_check

  def index
    users = User.order(created_at: :desc)
    @pagy, @users = pagy(users)
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

  def destroy
    user = User.find(params[:id])
    user.destroy

    redirect_to admin_users_path
  end
end

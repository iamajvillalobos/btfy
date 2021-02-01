class DeactivatedUsersController < ApplicationController
  before_action :authenticate_admin_user!
  skip_authorization_check

  def destroy
    user = User.find(params[:id])
    user.update(deactivated: true)
    user.links.destroy_all

    flash[:notice] = "Deactivation successful!"
    redirect_to admin_users_path
  end
end
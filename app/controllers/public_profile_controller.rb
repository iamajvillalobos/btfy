class PublicProfileController < ApplicationController
  layout "profile"

  def show
    @user = User.find_by(username: params[:username])
  end

  def update
    current_user.public_profile.update(public_profile_params)

    flash[:notice] = "Social links added to bio"
    redirect_to bio_path
  end

  private

  def public_profile_params
    params.require(:public_profile).permit(
      :facebook, :twitter, :instagram, :youtube, :tiktok
    )
  end
end
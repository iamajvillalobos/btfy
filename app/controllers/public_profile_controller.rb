class PublicProfileController < ApplicationController
  layout "profile"

  def show
    @user = User.find_by(username: params[:username])
  end
end
class PublicProfileLinksController < ApplicationController
  before_action :authenticate_user!

  def create
    link = current_user.links.find(params[:link_id])
    link.update(public_profile: current_user.public_profile)
    flash[:notice] = "Link added to bio"
    redirect_to bio_path
  end

  def destroy
    link = current_user.links.find(params[:id])
    link.update(public_profile: nil)
    flash[:notice] = "Link remove from bio"
    redirect_to bio_path
  end
end
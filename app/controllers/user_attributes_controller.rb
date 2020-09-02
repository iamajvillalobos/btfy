class UserAttributesController < ApplicationController
  def update
    flash[:notice] = if current_user.update(user_params)
      "Update successfully"
    else
      current_user.errors.full_messages.to_sentence
    end

    # Create public profile when enabling bio for the first time
    if current_user.bio
      PublicProfile.find_or_create_by(user: current_user)
    end

    redirect_to account_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :bio)
  end
end
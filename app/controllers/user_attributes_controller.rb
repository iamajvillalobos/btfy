class UserAttributesController < ApplicationController
  def update
    flash[:notice] = if current_user.update(user_params)
      "Update successfully"
    else
      current_user.errors.full_messages.to_sentence
    end

    redirect_to account_path
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
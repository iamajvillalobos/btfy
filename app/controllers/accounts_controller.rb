class AccountsController < ApplicationController
  before_action :authenticate_user!

  layout "dashboard"

  def show
    @account = current_user.account
  end

  def update
    account = current_user.account

    if account.update(account_params)
      flash[:notice] = "Profile update successfully"
    else
      flash[:notice] = account.errors.full_messages.to_sentence
    end

    redirect_to account_path
  end

  private

  def account_params
    params.require(:account).permit(:first_name, :last_name, :bio, :avatar, :timezone)
  end
end
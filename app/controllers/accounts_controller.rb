class AccountsController < ApplicationController
  before_action :authenticate_user!

  layout "dashboard"

  def show
    @account = Account.find_or_create_by(user: current_user)
  end

  def update
    account = current_user.account

    if account.update(account_params)
      flash[:notice] = "Profile update successfully"
      redirect_to account_path
    end
  end

  private

  def account_params
    params.require(:account).permit(:first_name, :last_name, :bio)
  end
end
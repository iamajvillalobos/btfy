class AccountsController < ApplicationController
  before_action :authenticate_user!

  layout "dashboard"

  def show
    @profile = Account.find_or_create_by(user: current_user)
  end

  def update
  end
end
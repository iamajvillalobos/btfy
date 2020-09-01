class AccountsController < ApplicationController
  before_action :authenticate_user!

  layout "dashboard"

  def show
  end
end
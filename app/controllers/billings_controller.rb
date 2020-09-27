class BillingsController < ApplicationController
  before_action :authenticate_user!

  layout "dashboard"

  def show
    @plans = Plan.all
  end
end
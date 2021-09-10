class BillingsController < ApplicationController
  before_action :authenticate_user!
  skip_authorization_check

  layout "dashboard"

  def show
    @plans = Plan.order_by_plan
  end

  def waiting
    render layout: "auth"
  end
end

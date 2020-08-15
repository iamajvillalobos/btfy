class UserPlansController < ApplicationController
  layout "dashboard"

  def index
    @plans = UserPlan.all.order(amount: :desc)
  end
end
class SubscriptionsController < ApplicationController
  layout "dashboard"
  
  def index
    @plans = UserPlan.all.reject { |u| u.name == "Free" }
  end

  def destroy
    current_user.subscription.cancel
    redirect_to billing_path, notice: "Cancelled plan successfully"
  end
end
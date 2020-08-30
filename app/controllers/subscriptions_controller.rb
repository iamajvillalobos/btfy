class SubscriptionsController < ApplicationController
  layout "dashboard"

  before_action :authenticate_user!
  
  def show
    redirect_to settings_path if current_user.subscribed?
    @plans = UserPlan.all.reject { |u| u.name == "Free" }.sort
  end

  def destroy
    current_user.subscription.cancel
    message = "We are sorry to see you leave. Your subscription has been cancelled."
    redirect_to settings_path, notice: message
  end
end
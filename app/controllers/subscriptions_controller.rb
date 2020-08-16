class SubscriptionsController < ApplicationController
  def destroy
    current_user.subscription.cancel
    redirect_to billing_path, notice: "Cancelled plan successfully"
  end
end
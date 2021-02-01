class RedeemsController < ApplicationController
  layout "auth"

  before_action :authenticate_user!
  skip_authorization_check

  def new
  end

  def create
    coupon = Coupon.find_by(code: params[:code], activated: false)

    if coupon
      lifetime_plan = Plan.find_by(period: "lifetime")
      Pay.subscription_model.create!(
        name: "default",
        owner: current_user,
        processor: "paddle",
        processor_id: "coupon",
        processor_plan: lifetime_plan.paddle_plan_id,
        quantity: "1",
        status: "active"
      )

      coupon.update(activated: true)

      flash[:notice] = "Coupon code applied!"
      redirect_to settings_path
    else
      flash[:error] = "Coupon code not found!"
      render :new
    end

    # verify code
    # create subscription
  end
end
class Admin::PlansController < ApplicationController
  layout "admin"

  before_action :authenticate_admin_user!
  skip_authorization_check

  def index
    @plans = Plan.order(period: :desc)
  end

  def edit
    @plan = Plan.find(params[:id])
  end

  def update
    @plan = Plan.find(params[:id])
    @plan.update(plan_params)

    flash[:notice] = "Updated Plan Successfully!"
    redirect_to admin_plans_path
  end

  private

  def plan_params
    params.require(:plan).permit(:period, :price)
  end
end

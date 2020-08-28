class Admin::UserPlansController < AdminController
  layout "admin"

  def index
    @pagy, @plans = pagy(UserPlan.order(created_at: :desc), items: 10)
  end

  def edit
    @user_plan = UserPlan.find(params[:id])
  end

  def update
    @user_plan = UserPlan.find(params[:id])
    if @user_plan.update(user_plan_params)
      redirect_to admin_user_plans_path
    else
      render :edit
    end
  end

  private

  def user_plan_params
    params.require(:user_plan).permit(:name, :paddle_plan_id)
  end
end
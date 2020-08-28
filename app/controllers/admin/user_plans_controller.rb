class Admin::UserPlansController < AdminController
  layout "admin"

  def index
    @pagy, @plans = pagy(UserPlan.order(created_at: :desc), items: 10)
  end
end
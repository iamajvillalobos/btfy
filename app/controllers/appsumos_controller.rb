class AppsumosController < ApplicationController
  skip_authorization_check
  before_action :check_if_logged_in?
  before_action :check_for_valid_coupon, only: [:create]

  layout "auth"

  def show
    @user = User.new
  end

  def create
    user = User.new(user_params)

    if user.save
      coupon = Coupon.find_by(code: params[:user][:coupon])
      coupon.update(activated: true)
      sign_in(user)
    end
  end

  private

  def check_if_logged_in?
    return unless current_user

    redirect_to dashboard_path
  end

  def check_for_valid_coupon
    unless Coupon.find_by(code: params[:user][:coupon])
      flash[:error] = "Invalid code. Please check again."
      redirect_to appsumo_path
    end
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
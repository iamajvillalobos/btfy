class Admin::CouponsController < ApplicationController
  layout "admin"

  before_action :authenticate_admin_user!
  skip_authorization_check

  def index
    @pagy, @coupons = pagy(Coupon.order(activated: :desc))
  end

  def import
    CSV.foreach(params[:csv], headers: true) do |row|
      Coupon.create!(code: row[0])
    end

    redirect_to admin_coupons_path
  end

end
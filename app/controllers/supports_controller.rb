class SupportsController < ApplicationController
  layout "dashboard"

  SUPPORT_EMAIL = "support@btfy.io"

  def new
  end

  def create
    SupportMailer.with(
      name: params[:name],
      email: params[:email],
      inquiry: params[:inquiry]
    ).inquiry_email.deliver_now

    flash[:notice] = "Your request has been received. We will contact you shortly."
    redirect_to root_path
  end
end

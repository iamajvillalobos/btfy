class SupportMailer < ApplicationMailer
  SUPPORT_EMAIL = "support@btfy.io"

  def inquiry_email
    @name = params[:name]
    @email = params[:email]
    @inquiry = params[:inquiry]

    mail(
      to: SUPPORT_EMAIL,
      subject: "Support inquiry from #{@name}"
    )
  end
end

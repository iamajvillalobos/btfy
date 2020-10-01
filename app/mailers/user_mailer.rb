class UserMailer < ApplicationMailer
  def welcome_email
    @user = params[:user]
    client = Postmark::ApiClient.new(
      ENV["POSTMARK_API_TOKEN"],
      secure: false
    )
    client.deliver_with_template(
      from: "support@btfy.io",
      to: @user.email,
      template_id: ENV["POSTMARK_WELCOME_EMAIL_TEMPLATE"],
      template_model: {}
    )
  end
end

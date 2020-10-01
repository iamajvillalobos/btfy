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
      template_id: 20461746,
      template_model: {}
    )
  end
end

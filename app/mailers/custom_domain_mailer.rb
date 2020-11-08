class CustomDomainMailer < ApplicationMailer
  def domain_ready_email
    @user = User.find(params[:user_id])
    @domain = CustomDomain.find(params[:domain_id])

    client = Postmark::ApiClient.new(
      ENV["POSTMARK_API_TOKEN"],
      secure: false
    )

    client.deliver_with_template(
      from: "support@btfy.io",
      to: @user.email,
      template_id: ENV["POSTMARK_DOMAIN_READY_TEMPLATE"],
      template_model: {
        user_domain: @domain.name
      }
    )
  end
end

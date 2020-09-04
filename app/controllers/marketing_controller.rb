class MarketingController < ApplicationController
  def index
    if request.host != ENV["DEFAULT_URL_HOST"]
      if custom_domain = CustomDomain.find_by(name: request.host)
        if custom_domain.redirect_url
          redirect_to custom_domain.redirect_url
        else
          render "errors/connected_domain", layout: "errors", locals: { domain: custom_domain}
        end
      else
        render "marketing/index"
      end
    end
  end
end
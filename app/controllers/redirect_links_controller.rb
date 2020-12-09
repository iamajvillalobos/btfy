class RedirectLinksController < ApplicationController
  layout "errors"
  skip_authorization_check

  def new
    link_details = LinkFinder.call(request, params[:slug])
    link = link_details.link

    if link
      redirect_to RedirectLink.call(link).url
    elsif link_details.custom_domain
      redirect_to link_details.custom_domain.not_found_url
    else
      render "errors/not_found"
    end
  end
end

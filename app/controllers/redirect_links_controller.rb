class RedirectLinksController < ApplicationController
  layout "errors"
  skip_authorization_check

  def new
    if link = LinkFinder.call(request, params[:slug])
      redirect_to RedirectLink.call(link.link).url
    else
      render "errors/not_found"
    end
  end
end

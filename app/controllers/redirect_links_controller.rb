class RedirectLinksController < ApplicationController
  layout "errors"
  skip_authorization_check

  def new
    link = LinkFinder.call(request, params[:slug]).link

    if link
      redirect_to RedirectLink.call(link).url
    else
      render "errors/not_found"
    end
  end
end

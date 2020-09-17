class RedirectLinksController < ApplicationController
  layout "errors"

  def new
    link = LinkFinder.call(request, params[:slug]).url

    if link
      redirect_to link
    else
      render "errors/not_found"
    end
  end
end

class RedirectLinksController < ApplicationController
  layout "errors"

  def new
    link = LinkFinder.call(request, params[:slug], ahoy).url

    if link
      redirect_to link
    else
      render "errors/not_found"
    end
  end
end

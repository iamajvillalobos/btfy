class RedirectLinksController < ApplicationController
  def new
    link = LinkFinder.call(request, params[:slug], ahoy).url
    redirect_to link
  end
end

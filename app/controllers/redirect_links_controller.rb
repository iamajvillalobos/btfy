class RedirectLinksController < ApplicationController
	def new
		link = LinkFinder.(request, params[:slug], ahoy).url
		redirect_to link
	end
end
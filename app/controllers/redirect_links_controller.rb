class RedirectLinksController < ApplicationController
	def new
		link = Link.find_by(slug: params[:slug])
		redirect_to link.destination_url
	end
end
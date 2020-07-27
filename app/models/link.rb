class Link < ApplicationRecord
	belongs_to :custom_domain, optional: true
	validates_presence_of :destination_url, :slug, :name
	validates_uniqueness_of :slug

	def redirect_url
		Rails.application.routes.url_helpers.redirect_url(
			host: host,
			slug: slug
		)
	end

	private

	def host
		return custom_domain.name if custom_domain
		Rails.application.routes.default_url_options[:host]
	end
end

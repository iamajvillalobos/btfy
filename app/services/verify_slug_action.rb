class VerifySlugAction
	extend LightService::Action

	expects :custom_domain, :slug
	promises :link, :url

	executed do |ctx|
		ctx.link = if ctx.custom_domain
			ctx.custom_domain.links.find_by(slug: ctx.slug)
		else
			Link.find_by(slug: ctx.slug, custom_domain: nil)
		end

		ctx.url = ctx.link.destination_url
	end
end
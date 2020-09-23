class VerifySlugAction
  extend LightService::Action

  expects :custom_domain, :slug
  promises :link, :url, :user

  executed do |ctx|
    ctx.link = if ctx.custom_domain
      ctx.custom_domain.links.find_by(slug: ctx.slug)
    else
      Link.find_by(slug: ctx.slug, custom_domain: nil)
    end

    if ctx.link.nil?
    	ctx.fail_and_return!
    end

    ctx.url = ctx.link.destination_url
    ctx.user = ctx.link.user
  end
end

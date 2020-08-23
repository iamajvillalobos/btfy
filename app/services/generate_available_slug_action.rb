class GenerateAvailableSlugAction
  extend LightService::Action

  promises :slug

  executed do |ctx|
    slug = SecureRandom.alphanumeric(5)
    link = Link.find_by(slug: slug, custom_domain: nil)

    ctx.slug = if link
      SecureRandom.alphanumeric(5)
    else
      slug
    end
  end
end

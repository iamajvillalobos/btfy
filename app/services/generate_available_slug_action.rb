class GenerateAvailableSlugAction
  extend LightService::Action

  promises :slug

  executed do |ctx|
    ctx.slug = if ctx[:link].slug.blank?
      slug = SecureRandom.alphanumeric(5)
      link = find_link(ctx, slug)
      link ? SecureRandom.alphanumeric(5) : slug
    else
      ctx[:link].slug
    end
  end

  def self.find_link(ctx, slug)
    if ctx[:link].custom_domain_id
      Link.find_by(slug: slug, custom_domain_id: ctx[:link].custom_domain_id)
    else
      Link.find_by(slug: slug, custom_domain_id: nil)
    end
  end
end

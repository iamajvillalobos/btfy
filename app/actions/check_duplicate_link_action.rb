class CheckDuplicateLinkAction
  extend LightService::Action

  expects :link
  promises :link

  executed do |ctx|
    link = Link.find_by(
      destination_url: ctx.link.destination_url,
      custom_domain_id: ctx.link.custom_domain_id
    )

    if link
      ctx.link = link
      ctx.skip_remaining!
    end
  end
end
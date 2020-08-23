class SaveLinkAction
  extend LightService::Action

  expects :name, :slug

  executed do |ctx|
    link = ctx[:link]

    link.name = ctx.name
    link.slug = ctx.slug

    unless link.save
      ctx.fail!(link.errors.full_messages)
    end
  end
end

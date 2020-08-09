class SaveDomainAction
  extend LightService::Action

  expects :domain

  executed do |ctx|
    unless ctx.domain.save
      ctx.fail!(ctx.domain.error.full_messages)
    end
  end
end

class ValidateDomainNameAction
  extend LightService::Action

  expects :domain

  executed do |ctx|
    unless ctx.domain.valid?
      ctx.fail_and_return!(ctx.domain.errors.full_messages.to_sentence)
    end
  end
end

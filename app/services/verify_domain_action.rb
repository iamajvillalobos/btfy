class VerifyDomainAction
  extend LightService::Action

  expects :domain
  promises :custom_domain

  executed do |ctx|
    ctx.custom_domain = CustomDomain.find_by(name: ctx.domain)
  end
end

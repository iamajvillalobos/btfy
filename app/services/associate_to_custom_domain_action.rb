class AssociateToCustomDomainAction
  extend LightService::Action

  promises :custom_domain

  executed do |ctx|
    ctx.custom_domain = nil
    
    next unless ctx[:link].custom_domain_id

    custom_domain = CustomDomain.find(ctx[:link].custom_domain_id)
    if custom_domain.user_id == ctx[:link].user_id
      ctx.custom_domain = custom_domain
    else
      message = "The user_id doesn't have access to the custom domain"
      ctx.fail_and_return!(message)
    end
  end
end
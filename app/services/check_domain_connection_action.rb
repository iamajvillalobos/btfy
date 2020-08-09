class CheckDomainConnectionAction
  extend LightService::Action

  expects :domain

  executed do |ctx|
    domain_ip =
      begin
        Resolv.getaddress(ctx.domain.name)
      rescue Resolv::ResolvError
        ctx.fail_and_return!("Domain is not valid. Please check again.")
      end
    host_ip = Resolv.getaddress(ENV["DEFAULT_URL_HOST"])

    if domain_ip != host_ip
      ctx.fail_and_return!("Domain not configured properly.")
    end
  end
end

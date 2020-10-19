class CheckDomainConnectionAction
  extend LightService::Action

  expects :domain

  executed do |ctx|
    host_ip = get_ip(ENV.fetch("DEFAULT_URL_HOST"))
    domain_ip = get_ip(ctx.domain.name)

    if host_ip != domain_ip
      ctx.fail_and_return!("Domain not configured properly.")
    end
  end

  def self.get_ip(domain)
    Resolv.getaddress(domain)
  rescue Resolv::ResolvError
    nil
  end
end

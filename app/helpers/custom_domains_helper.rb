module CustomDomainsHelper
  def custom_domain_dropdown
    domains = current_user.custom_domains.success.map { |cd| [cd.name, cd.id] }.sort
    domains.unshift([ENV["DEFAULT_URL_HOST"], nil])
    domains
  end
end

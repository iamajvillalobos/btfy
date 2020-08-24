module CustomDomainsHelper
  def custom_domain_dropdown
    domains = current_user.custom_domains.map { |cd| [cd.name, cd.id] }
    domains << [ENV["DEFAULT_URL_HOST"], nil]
    domains.sort
  end
end
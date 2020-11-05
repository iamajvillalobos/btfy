class AddDnsCustomDomain < ActiveRecord::Migration[6.0]
  def change
    add_column :custom_domains, :dns_target, :text
  end
end

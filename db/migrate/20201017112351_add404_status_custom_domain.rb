class Add404StatusCustomDomain < ActiveRecord::Migration[6.0]
  def change
    add_column :custom_domains, :not_found_url, :string
    add_column :custom_domains, :status, :integer, default: 0
  end
end

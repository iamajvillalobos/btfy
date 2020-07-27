class AssociateLinksAndCustomDomainsToUser < ActiveRecord::Migration[6.0]
  def change
  	change_table :links do |t|
  		t.references :user
  	end

  	change_table :custom_domains do |t|
  		t.references :user
  	end
  end
end

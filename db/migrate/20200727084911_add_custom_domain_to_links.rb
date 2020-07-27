class AddCustomDomainToLinks < ActiveRecord::Migration[6.0]
  def change
    change_table :links do |t|
    	t.references :custom_domain
    end
  end
end

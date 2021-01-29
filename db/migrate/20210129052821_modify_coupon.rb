class ModifyCoupon < ActiveRecord::Migration[6.1]
  def change
    remove_column :coupons, :uses, :integer
    add_column :coupons, :activated, :boolean, default: false
  end
end

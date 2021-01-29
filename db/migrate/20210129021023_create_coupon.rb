class CreateCoupon < ActiveRecord::Migration[6.1]
  def change
    create_table :coupons do |t|
      t.text :code, null: false
      t.integer :uses, default: 1
      t.timestamps
    end
  end
end

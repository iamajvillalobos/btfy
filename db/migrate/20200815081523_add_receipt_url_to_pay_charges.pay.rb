# This migration comes from pay (originally 20200603134648)
class AddReceiptUrlToPayCharges < ActiveRecord::Migration[4.2]
  def change
    add_column :pay_charges, :receipt_url, :string
  end
end

class AddTimezoneToAccount < ActiveRecord::Migration[6.0]
  def change
    add_column :accounts, :timezone, :string
  end
end

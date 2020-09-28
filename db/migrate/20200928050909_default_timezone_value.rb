class DefaultTimezoneValue < ActiveRecord::Migration[6.0]
  def up
    change_column :accounts, :timezone, :string, default: "UTC"
  end

  def down
    change_column :accounts, :timezone, :string
  end
end

class AccountTimezoneDefault < ActiveRecord::Migration[6.0]
  def change
    change_column :accounts, :timezone, :string, default: nil
  end
end

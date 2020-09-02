class AddBioToggleToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :bio, :boolean, default: false
  end
end

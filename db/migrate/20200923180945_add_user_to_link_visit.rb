class AddUserToLinkVisit < ActiveRecord::Migration[6.0]
  def change
    add_column :link_visits, :user_id, :bigint, index: true
  end
end

class AddLinksToPublicProfile < ActiveRecord::Migration[6.0]
  def change
    add_column :links, :public_profile_id, :bigint, index: true
  end
end

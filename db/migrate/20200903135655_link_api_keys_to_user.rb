class LinkApiKeysToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :api_keys, :user_id, :bigint, index: true
  end
end

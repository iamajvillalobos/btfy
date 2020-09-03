class CreateApiKeys < ActiveRecord::Migration[6.0]
  def change
    create_table :api_keys do |t|
      t.text :key, null: false, unique: true
      t.text :client_name, null: false
      t.datetime :created_at, null: false
      t.datetime :deactivated_at, null: true
    end

    add_index :api_keys, :key, unique: true
  end
end

class CreateSalts < ActiveRecord::Migration[6.0]
  def change
    create_table :salts do |t|
      t.text :key
      t.timestamps
    end

    add_index :salts, :key, unique: true
  end
end

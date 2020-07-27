class CreateLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :links do |t|
      t.text :destination_url
      t.string :name
      t.string :slug

      t.timestamps
    end
  end
end

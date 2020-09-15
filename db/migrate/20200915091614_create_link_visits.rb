class CreateLinkVisits < ActiveRecord::Migration[6.0]
  def change
    create_table :link_visits do |t|
      t.belongs_to :link
      t.text :visitor_hash
      t.string :browser
      t.string :device_type
      t.string :country
      t.string :referrer

      t.timestamps
    end
  end
end

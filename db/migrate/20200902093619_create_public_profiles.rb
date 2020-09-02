class CreatePublicProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :public_profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end

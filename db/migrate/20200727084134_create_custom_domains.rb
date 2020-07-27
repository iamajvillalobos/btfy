class CreateCustomDomains < ActiveRecord::Migration[6.0]
  def change
    create_table :custom_domains do |t|
      t.string :name, unique: true
      t.string :redirect_url

      t.timestamps
    end
  end
end

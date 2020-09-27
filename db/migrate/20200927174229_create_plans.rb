class CreatePlans < ActiveRecord::Migration[6.0]
  def change
    create_table :plans do |t|
      t.string :period
      t.decimal :price
      t.string :paddle_plan_id
      t.timestamps
    end
  end
end

class CreateUserPlans < ActiveRecord::Migration[6.0]
  def change
    create_table :user_plans do |t|
      t.string :name
      t.decimal :amount, default: 0.0, null: false
      t.string :interval
      t.integer :paddle_plan_id
      t.timestamps
    end
  end
end

class RemoveUserPlan < ActiveRecord::Migration[6.0]
  def change
    drop_table :user_plans
  end
end

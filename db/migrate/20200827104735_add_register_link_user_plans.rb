class AddRegisterLinkUserPlans < ActiveRecord::Migration[6.0]
  def change
    add_column :user_plans, :register_link, :text
  end
end

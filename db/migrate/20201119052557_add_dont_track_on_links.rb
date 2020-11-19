class AddDontTrackOnLinks < ActiveRecord::Migration[6.0]
  def change
    add_column :links, :no_tracking, :boolean, default: true
    add_index :links, :no_tracking
  end
end

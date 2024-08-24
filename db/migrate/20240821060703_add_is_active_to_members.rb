class AddIsActiveToMembers < ActiveRecord::Migration[6.1]
  def change
    add_column :members, :is_deleted, :boolean, default: false, null: false
  end
end

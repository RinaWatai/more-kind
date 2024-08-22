class AddIsActiveToMembers < ActiveRecord::Migration[6.1]
  def change
    add_column :members, :is_active, :boolean, default: true
  end
end

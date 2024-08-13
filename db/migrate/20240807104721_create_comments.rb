class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :body, null: false
      t.float :rate, null: false, default:0
      t.integer :member_id, null: false
      t.integer :facility_id, null: false

      t.timestamps
    end
  end
end

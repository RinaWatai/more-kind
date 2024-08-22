class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :body, null: false
      t.float :rate, null: false, default:0
      t.integer :member_id, null: false
      t.integer :facility_id, null: false
      t.float       :all_rating, null: false, default: 0
      t.float       :rating1, null: false, default: 0
      t.float       :rating2, null: false, default: 0
      t.float       :rating3, null: false, default: 0
      t.float       :rating4, null: false, default: 0

      t.timestamps
    end
  end
end

class CreateFacilities < ActiveRecord::Migration[6.1]
  def change
    
    create_table :facilities do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.integer :member_id, null: false

      t.timestamps
    end
  end
end

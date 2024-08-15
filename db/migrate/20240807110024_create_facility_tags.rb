class CreateFacilityTags < ActiveRecord::Migration[6.1]
  def change
    create_table :facility_tags do |t|
      t.string :body, null: false
      t.integer :tag_id
      t.integer :facility_id, null: false
      t.timestamps
    end
  end
end

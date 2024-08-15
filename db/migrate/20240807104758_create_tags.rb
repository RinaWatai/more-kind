class CreateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags do |t|
      t.string :name, null: false
      t.integer :facility_tag_id, null: false

      t.timestamps
    end
  end
end

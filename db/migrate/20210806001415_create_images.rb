class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :image_id, null: false
      t.integer :volunteer_image_id
      t.timestamps
    end
  end
end

class CreateUserRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :user_rooms do |t|
      t.references :customer, foreign_key: true, null: false
      t.references :recruiter, foreign_key: true, null: false
      t.references :room, foreign_key: true, null: false
      
      t.timestamps
    end
    add_index :user_rooms, [:customer_id, :room_id, :recruiter_id], unique: true
  end
end

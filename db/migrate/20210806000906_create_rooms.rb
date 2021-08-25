class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.datetime :customer_time
      t.references :message, foreign_key: true
      
      t.timestamps
    end
  end
end

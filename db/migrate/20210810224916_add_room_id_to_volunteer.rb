class AddRoomIdToVolunteer < ActiveRecord::Migration[5.2]
  def change
    add_column :volunteers, :room_id, :integer
  end
end

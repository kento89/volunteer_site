class AddVolunteerIdToRoom < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :volunteer_id, :integer
  end
end

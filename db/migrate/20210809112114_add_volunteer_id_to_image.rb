class AddVolunteerIdToImage < ActiveRecord::Migration[5.2]
  def change
    add_column :images, :volunteer_id, :integer
  end
end

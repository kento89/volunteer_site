class ChangeDataImageIdToVolunteerImage < ActiveRecord::Migration[5.2]
  def change
    change_column :volunteer_images, :image_id, :string
  end
end

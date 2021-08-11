class CreateVolunteerImages < ActiveRecord::Migration[5.2]
  def change
    create_table :volunteer_images do |t|

      t.timestamps
    end
  end
end

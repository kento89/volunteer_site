class AddVolunteerStatusToVolunteers < ActiveRecord::Migration[5.2]
  def change
    remove_column :volunteers, :volunteer_status, :boolean
  end
end

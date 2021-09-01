class AddVolunteerStatusToVolunteers < ActiveRecord::Migration[5.2]
  def change
    add_column :volunteers, :volunteer_status, :boolean, default:false
  end
end

class AddRecruieterIdToVolunteer < ActiveRecord::Migration[5.2]
  def change
    add_column :volunteers, :recruiter_id, :integer
  end
end

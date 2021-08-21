class ChageDataLimitToVolunteer < ActiveRecord::Migration[5.2]
  def change
    change_column :volunteers, :limit, :date
  end
end

class AddVolunteerIdToCustomer < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :volunteer_id, :integer
  end
end

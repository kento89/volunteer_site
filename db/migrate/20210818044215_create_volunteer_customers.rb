class CreateVolunteerCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :volunteer_customers do |t|
      t.references :volunteer, foreign_key: true
      t.references :customer, foreign_key: true
      t.timestamps
    end
  end
end

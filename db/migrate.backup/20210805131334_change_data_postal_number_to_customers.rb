class ChangeDataPostalNumberToCustomers < ActiveRecord::Migration[5.2]
  def change
    change_column :customers, :postal_number, :integer
    change_column :customers, :phone_number, :integer
  end
end

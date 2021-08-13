class AddCustomerIdToMessage < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :customer_id, :integer
  end
end

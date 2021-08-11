class RenameProfileImageUrlColumnToCustomers < ActiveRecord::Migration[5.2]
  def change
    rename_column :customers, :profile_image_url, :image_id
  end
end

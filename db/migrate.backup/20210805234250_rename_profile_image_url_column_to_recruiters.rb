class RenameProfileImageUrlColumnToRecruiters < ActiveRecord::Migration[5.2]
  def change
    rename_column :recruiters, :profile_image_url, :image_id
  end
end

class RenamePostalCodeColumnToRecruiters < ActiveRecord::Migration[5.2]
  def change
    rename_column :recruiters, :postal_code, :postal_number
  end
end

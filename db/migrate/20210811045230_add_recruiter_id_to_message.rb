class AddRecruiterIdToMessage < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :recruiter_id, :integer
  end
end

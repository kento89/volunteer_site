class CreateApplies < ActiveRecord::Migration[5.2]
  def change
    create_table :applies do |t|
      t.references :customer, foreign_key: true
      t.references :volunteer, foreign_key: true
      t.timestamps
    end
  end
end

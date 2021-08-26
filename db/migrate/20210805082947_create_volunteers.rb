class CreateVolunteers < ActiveRecord::Migration[5.2]
  def change
    create_table :volunteers do |t|
      t.string :name, null: false
      t.text :a_litle_explanation, null: false
      t.text :explanation, null: false
      t.string :place, null: false
      t.datetime :time, null: false
      t.integer :people, null: false
      t.text :merit, null: false
      t.string :necessary_item, null: false
      t.text :important_point, null: false
      t.text :comment, null: false
      t.datetime :limit, null: false
      t.integer :genre, null: false, default: 0
      t.boolean :recruiter_status, null: false, default: true
      t.boolean :volunteer_status, null: false, default: true
      t.references :recruiter, foreign_key: true
      t.references :apply, foreign_key: true
      t.references :volunteer_customer, foreign_key: true
      t.timestamps
    end
  end
end

class CreateInternships < ActiveRecord::Migration
  def change
    create_table :internships do |t|
      t.references :user
      t.string :title
      t.string :company
      t.string :internship_type
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
    add_index :internships, :user_id
  end
end

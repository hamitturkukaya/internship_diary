class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.references :user
      t.string :university,               :null => false, :default => ""
      t.string :faculty,                  :null => false, :default => ""
      t.string :department,               :null => false, :default => ""

      t.timestamps
    end
    add_index :educations, :user_id
  end
end

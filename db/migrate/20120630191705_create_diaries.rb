class CreateDiaries < ActiveRecord::Migration
  def change
    create_table :diaries do |t|
      t.references :internship
      t.references :user
      t.string :name
      t.text :content
      t.boolean :private

      t.timestamps
    end
    add_index :diaries, :internship_id
    add_index :diaries, :user_id
  end
end

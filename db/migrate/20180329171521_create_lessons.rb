class CreateLessons < ActiveRecord::Migration[5.1]
  def change
    create_table :lessons do |t|
      t.string :category
      t.string :content
      t.string :date_and_time
      t.string :start
      t.string :dead_line
      t.string :term
      t.string :place
      t.integer :user_id

      t.timestamps
    end
  end
end

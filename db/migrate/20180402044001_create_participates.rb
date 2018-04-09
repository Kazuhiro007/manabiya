class CreateParticipates < ActiveRecord::Migration[5.1]
  def change
    create_table :participates do |t|
      t.integer :user_id
      t.integer :lesson_id

      t.timestamps
    end
  end
end

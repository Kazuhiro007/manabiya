class AddMaxToLesson < ActiveRecord::Migration[5.1]
  def change
    add_column :lessons, :max, :integer
  end
end

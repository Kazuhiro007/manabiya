class AddPriceToLessons < ActiveRecord::Migration[5.1]
  def change
    add_column :lessons, :price, :string
  end
end

class DropTableFoodItems < ActiveRecord::Migration[6.0]
  def change
    drop_table :food_items
  end
end

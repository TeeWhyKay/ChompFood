class DropTableRestaurant < ActiveRecord::Migration[6.0]
  def change
    drop_table :restaurants
  end
end

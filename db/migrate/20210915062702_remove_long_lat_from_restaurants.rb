class RemoveLongLatFromRestaurants < ActiveRecord::Migration[6.0]
  def change
    remove_column :restaurants, :long
    remove_column :restaurants, :lat
  end
end

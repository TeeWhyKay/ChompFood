class AddRestaurantReferenceToFood < ActiveRecord::Migration[6.0]
  def change
    add_reference :foods, :restaurant, foreign_key: true
  end
end

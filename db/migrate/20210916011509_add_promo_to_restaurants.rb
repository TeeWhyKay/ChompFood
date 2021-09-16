class AddPromoToRestaurants < ActiveRecord::Migration[6.0]
  def change
    add_column :restaurants, :promo_status, :integer
  end
end

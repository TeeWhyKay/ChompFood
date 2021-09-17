class RemovePriceAndMonetize < ActiveRecord::Migration[6.0]
  def change
    remove_column :foods, :price
  end
end

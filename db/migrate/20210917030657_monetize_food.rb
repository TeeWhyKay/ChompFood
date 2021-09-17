class MonetizeFood < ActiveRecord::Migration[6.0]
  def change
    add_monetize :foods, :price
  end
end

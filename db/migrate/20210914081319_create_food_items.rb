class CreateFoodItems < ActiveRecord::Migration[6.0]
  def change
    create_table :food_items do |t|
      t.string :name
      t.text :description
      t.float :price
      t.string :photo_url
      t.timestamps
    end
  end
end

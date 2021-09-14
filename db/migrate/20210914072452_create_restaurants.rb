class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.float :lat
      t.float :long
      t.datetime :opening_time
      t.datetime :closing_time

      t.timestamps
    end
  end
end

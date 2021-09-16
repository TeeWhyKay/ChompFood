class AddNewColumns < ActiveRecord::Migration[6.0]
  def change
    add_column :restaurants, :rating, :integer
    add_column :restaurants, :cuisine, :string
  end
end

class AddOwnerToRestaurant < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurant, :skills2, :integer
  end
end

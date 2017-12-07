class AddOwnerToRestaurant < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :owner, :integer
  end
end

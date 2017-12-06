class AddUrlToRestaurant < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :pic_url, :string
  end
end

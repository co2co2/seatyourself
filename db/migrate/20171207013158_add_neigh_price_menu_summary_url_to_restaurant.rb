class AddNeighPriceMenuSummaryUrlToRestaurant < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :neighborhood, :string
    add_column :restaurants, :price_range, :integer
    add_column :restaurants, :menu, :text
    add_column :restaurants, :summary, :text
    add_column :restaurants, :pic_url, :string
  end
end

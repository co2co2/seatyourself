class RestaurantHours < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :open_hour, :time
    add_column :restaurants, :close_hour, :time
  end
end

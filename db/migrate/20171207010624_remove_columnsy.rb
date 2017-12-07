class RemoveColumnsy < ActiveRecord::Migration[5.0]
  def change
    remove_column :restaurants, :neighborhood
    remove_column :restaurants, :summary
    remove_column :restaurants, :price_range
  end
end

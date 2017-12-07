class ChangePriceRangeToString < ActiveRecord::Migration[5.0]
  def change
    change_column :restaurants, :price_range, :string
  end
end

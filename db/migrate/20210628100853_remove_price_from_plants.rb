class RemovePriceFromPlants < ActiveRecord::Migration[6.0]
  def change
    remove_column :plants, :price, :integer
  end
end

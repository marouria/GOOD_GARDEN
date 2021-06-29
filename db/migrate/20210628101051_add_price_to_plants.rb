class AddPriceToPlants < ActiveRecord::Migration[6.0]
  def change
    add_monetize :plants, :price, currency: { present: false }
  end
end

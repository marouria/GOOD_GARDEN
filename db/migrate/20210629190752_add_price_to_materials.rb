class AddPriceToMaterials < ActiveRecord::Migration[6.0]
  def change
    add_monetize :materials, :price, currency: { present: false }
  end
end

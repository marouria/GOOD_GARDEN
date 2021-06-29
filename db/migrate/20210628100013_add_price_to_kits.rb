class AddPriceToKits < ActiveRecord::Migration[6.0]
  def change
    add_monetize :kits, :price, currency: { present: false }
  end
end

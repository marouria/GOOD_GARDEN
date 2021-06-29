class RemoveKitPriceFromKits < ActiveRecord::Migration[6.0]
  def change
    remove_column :kits, :kit_price, :integer
  end
end

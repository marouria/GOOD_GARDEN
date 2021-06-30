class AddMaterialRefToKits < ActiveRecord::Migration[6.0]
  def change
    add_reference :kits, :material, foreign_key: true
  end
end

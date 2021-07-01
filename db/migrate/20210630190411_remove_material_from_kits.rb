class RemoveMaterialFromKits < ActiveRecord::Migration[6.0]
  def change
    remove_reference :kits, :material, null: false, foreign_key: true
  end
end

class CreateKitMaterials < ActiveRecord::Migration[6.0]
  def change
    create_table :kit_materials do |t|
      t.references :kit, null: false, foreign_key: true
      t.references :material, null: false, foreign_key: true

      t.timestamps
    end
  end
end

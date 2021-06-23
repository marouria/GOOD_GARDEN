class CreateKitPlants < ActiveRecord::Migration[6.0]
  def change
    create_table :kit_plants do |t|
      t.references :plant, null: false, foreign_key: true
      t.references :kit, null: false, foreign_key: true

      t.timestamps
    end
  end
end

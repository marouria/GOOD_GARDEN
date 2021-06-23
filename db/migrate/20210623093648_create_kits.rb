class CreateKits < ActiveRecord::Migration[6.0]
  def change
    create_table :kits do |t|
      t.string :slot
      t.string :img_url
      t.integer :kit_price
      t.string :name
      t.boolean :tools, default:false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

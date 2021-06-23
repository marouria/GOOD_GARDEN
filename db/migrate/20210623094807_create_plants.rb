class CreatePlants < ActiveRecord::Migration[6.0]
  def change
    create_table :plants do |t|
      t.string :name
      t.integer :sunshine_rate
      t.integer :watering
      t.string :img_url
      t.string :season
      t.string :user_level
      t.integer :price
      t.integer :stock

      t.timestamps
    end
  end
end

class AddDescriptionToPlants < ActiveRecord::Migration[6.0]
  def change
    add_column :plants, :description, :string
  end
end

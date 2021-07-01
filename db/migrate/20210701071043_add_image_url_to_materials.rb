class AddImageUrlToMaterials < ActiveRecord::Migration[6.0]
  def change
    add_column :materials, :image_url, :string
  end
end

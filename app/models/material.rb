class Material < ApplicationRecord
  has_many :kit_materials
  has_many :kits, through: :kit_materials
  monetize :price_cents
end

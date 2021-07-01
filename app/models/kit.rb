class Kit < ApplicationRecord
  belongs_to :user
  has_many :kit_plants
  has_many :plants, through: :kit_plants
  has_many :kit_materials
  has_many :materials, through: :kit_materials
  has_many :orders
  monetize :price_cents
  # belongs_to :material
end

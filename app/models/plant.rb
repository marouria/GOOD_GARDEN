class Plant < ApplicationRecord
  has_many :kit_plants
  has_many :kits, through: :kit_plants
end

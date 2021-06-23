class Plant < ApplicationRecord
  has_many :kits, through: :kit_plants
end

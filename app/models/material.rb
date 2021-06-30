class Material < ApplicationRecord
  has_many :kits
  monetize :price_cents
end

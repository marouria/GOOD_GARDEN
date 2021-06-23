class Kit < ApplicationRecord
  belongs_to :user
  has_many :plants, through: :kit_plants
  has_many :orders
end

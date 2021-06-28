class Order < ApplicationRecord
  belongs_to :user
  belongs_to :kit
  monetize :amount_cents
end

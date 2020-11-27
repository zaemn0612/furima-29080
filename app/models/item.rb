class Item < ApplicationRecord
  belongs_to:user
  has_one_attached :image
  belongs_to :category
  belongs_to :product_condition
  belongs_to :shipping_charges
  belongs_to :shipping_address
  belongs_to :estimated_shipping_date
end
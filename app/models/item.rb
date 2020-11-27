class Item < ApplicationRecord
  belongs_to:user
  has_one_attached :image
  belongs_to :category
  belongs_to :product_condition
  belongs_to :shipping_charges
  belongs_to :shipping_address
  belongs_to :estimated_shipping_date

  validates :title, :text, presence: true
  validates :category, :product_condition, :shipping_charges, :shipping_address, :estimated_shipping_date, numericality: { other_than: 1 } 

end
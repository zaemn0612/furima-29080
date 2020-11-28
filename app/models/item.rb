class Item < ApplicationRecord
  belongs_to:user
  has_one_attached :image
  belongs_to :category
  belongs_to :product_condition
  belongs_to :shipping_charges
  belongs_to :shipping_address
  belongs_to :estimated_shipping_date

with_options presence: true do
  validates :title, :text, presence: true
  validates :product_name, :comment, :category, :product_condition, :shipping_charges, :shipping_address, :estimated_shipping_date, numericality: { other_than: 1 } 
  validates :price, format: { with: /\A[a-zA-Z0-9]+\z/, message: "半角英数字"}
  validates :price, format: { with: /[300-9999999]/, message: ""}
 end
end
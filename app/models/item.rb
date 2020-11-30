class Item < ApplicationRecord
  belongs_to:user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_condition
  belongs_to :shipping_charge
  belongs_to :shipping_address
  belongs_to :estimated_shipping_date

with_options presence: true do
  validates :product_name, :comment
  validates :category_id, :product_condition_id, :shipping_charges_id, :shipping_address_id, :estimated_shipping_date_id, numericality: { other_than: 1 } 
  validates :price, format: { with: /\A[a-zA-Z0-9]+\z/, message: "半角英数字"}
  validates :price, format: { with: greater_than_or_equal_to: 300,less_than_or_equal_to: 9_999_999 message: ""}
 end
end
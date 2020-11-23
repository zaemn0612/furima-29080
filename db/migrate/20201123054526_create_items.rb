class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user,                     null: false, foreign_key: true
      t.string  :product_name,                null: false
      t.string  :price,                       null: false
      t.string  :comment,                     null: false
      t.integer :category_id,                 null: false
      t.integer :product_condition_id,        null: false
      t.integer :shipping_charges_id,         null: false
      t.integer :shipping_address_id,         null: false
      t.integer :estimated_shipping_date_id,  null: false
      t.timestamps
    end
  end
end

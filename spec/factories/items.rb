FactoryBot.define do
  factory :item do
    product_name               {Faker::Lorem.sentence}
    comment                    {Faker::Lorem.sentence}
    category_id                {2}
    price                      {400}
    product_condition_id       {2}
    shipping_charges_id        {2}
    shipping_address_id        {2}
    estimated_shipping_date_id {2}
    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/150017.jpg'), filename: '150017.jpg')
    end
  end
end
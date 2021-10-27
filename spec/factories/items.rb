FactoryBot.define do
  factory :item do
    name { Faker::Commerce.product_name }
    description { Faker::Lorem.sentences }
    unit_price { Faker::Number.decimal(l_digits: 2) }
    merchant { Faker::Number.non_zero_digit }
  end
end

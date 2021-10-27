FactoryBot.define do
  factory :invoice_item do
    quantity { Faker::Number.digit }
    unit_price { Faker::Number.decimal(l_digits: 2) }
    item { Faker::Number.non_zero_digit }
    invoice { Faker::Number.non_zero_digit }
  end
end

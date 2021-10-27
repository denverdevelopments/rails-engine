FactoryBot.define do
  factory :transaction do
    credit_card_number { Faker::Number.number(digits: 10).to_s }
    credit_card_expiration_date { Faker::Business.credit_card_expiry_date.to_s }
    # credit_card_expiration_date { Faker::Date.between(from: '2014-09-23', to: '2014-09-25')..strftime("%m/%Y") }
    result { Faker::Number.within(range: 0..1) }
    invoice { Faker::Number.non_zero_digit }
  end
end

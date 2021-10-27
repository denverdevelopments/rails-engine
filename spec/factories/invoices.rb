FactoryBot.define do
  factory :invoice do
    status { Faker::Number.within(range: 0..2) }   #shipped
    merchant { Faker::Number.non_zero_digit }
    customer { Faker::Number.non_zero_digit }
  end
end

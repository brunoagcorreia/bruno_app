FactoryBot.define do

  factory :random_comment, class: Comment do
    id { Faker::Number.number(5).to_i }
    user_id { Faker::Number.number(5).to_i }
    product_id { Faker::Number.number(5).to_i }
    body { Faker::Lebowski.quote }
    rating { Faker::Number.non_zero_digit.to_i/2 }
  end

end

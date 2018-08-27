FactoryBot.define do

  factory :random_product, class: Product do
    id { Faker::Number.number(5).to_i }
    name { Faker::StarWars.droid }
    brand { Faker::Cannabis.strain }
    description { Faker::StarWars.wookiee_sentence }
    image_url { Faker::Cannabis.cannabinoid }
    price { Faker::Number.decimal(2,2) }
  end

end

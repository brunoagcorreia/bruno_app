FactoryBot.define do

  factory :random_user, class: User do
    id { Faker::Number.number(5).to_i }
    email { Faker::Internet.safe_email }
    password { Faker::Internet.password(min_length = 8, max_length = 16) }
    first_name { Faker::Name.female_first_name }
    last_name { Faker::Name.last_name }
    # admin false
  end

end

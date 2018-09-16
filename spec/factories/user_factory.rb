FactoryBot.define do
  factory :random_user, class: User do
    id { Faker::Number.number(5).to_i }
    email { Faker::Internet.safe_email }
    password { Faker::Internet.password(min_length = 8, max_length = 16) }
    first_name { Faker::Name.female_first_name }
    last_name { Faker::Name.last_name }
  end

  # sequence(:email) { |n| "user#{n}@example.com" }
  #
  # factory :random_user, class: User do
  #   email
  #   password "1234567890"
  #   first_name "Peter"
  #   last_name "Example"
  #   admin false
  # end

  # factory :admin, class: User do
  #   email
  #   password "qwertyuiop"
  #   admin true
  #   first_name "Admin"
  #   last_name "User"
  # end

end

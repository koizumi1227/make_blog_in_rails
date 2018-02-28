FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "usersample#{n}" }
    sequence(:email) { |n| "usersample#{n}@example.com" }
    password "password"
  end
end

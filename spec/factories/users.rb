FactoryBot.define do
  factory :user do
    name "test user"
    description "User's Description"
    number {rand(1..10000)}
    date { rand(1..100).days.from_now }
  end
end
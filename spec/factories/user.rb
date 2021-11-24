FactoryBot.define do
  factory :user do
    username { Faker::Internet.username(specifier: 4) }
  end
end

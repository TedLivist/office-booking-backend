FactoryBot.define do
  factory :user do
    username { Faker::Name.name.truncate(5) }
  end
end

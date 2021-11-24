FactoryBot.define do
  factory :item do
    name { Faker::Name.name.truncate(5) }
    location { Faker::Address.city }
    image { Faker::LoremPixel.image }
    description { Faker::Lorem.sentence }
  end
end

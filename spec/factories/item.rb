FactoryBot.define do
  factory :item do
    name { Faker::Name.name.truncate(5) }
    location { Faker::Address.city }
    image { Faker::LoremPixel.image(size: '300x300') }
    description { Faker::Lorem.sentence }
  end
end

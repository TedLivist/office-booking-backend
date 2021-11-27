FactoryBot.define do
  factory :item do
    name { Faker::Name.name.truncate(5) }
    location { Faker::Address.city }
    image { 'https://image.freepik.com/free-vector/flat-exotic-bird-collection_23-2147735891.jpg' }
    description { Faker::Lorem.sentence }
  end
end

FactoryBot.define do
  factory :reservation do
    user_id { 1 }
    item_id { 1 }
    start_date { Date.today }
    end_date { Date.today + 1 }
  end
end

FactoryBot.define do
  factory :reservation do
    user { create(:user) }
    item { create(:item) }
    start_date { Date.today }
    end_date { Date.today + 1 }
  end
end

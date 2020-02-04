FactoryBot.define do
  factory :car_category do
    name { 'A' }
    daily_rate { 100.99 }
    car_insurance { 45.59 }
    third_party_insurance { 30.95 }
  end
end

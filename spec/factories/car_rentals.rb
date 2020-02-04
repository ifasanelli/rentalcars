FactoryBot.define do
  factory :car_rental do
    car
    rental
    price { 159.95 }
    start_mileage { 200 }
    end_mileage { 1200 }
  end
end

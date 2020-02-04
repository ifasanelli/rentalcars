FactoryBot.define do
  factory :car_model do
    name { 'Palio' }
    year { '2019' }
    motorization { '1.6' }
    fuel_type { 'Gasolina' }
    manufacturer
    car_category
  end
end

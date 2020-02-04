FactoryBot.define do
  factory :car do
    license_plate { 'ABC-1234' }
    color { 'Prata' }
    car_model
    mileage { 200 }
    subsidiary
    status { :available }
  end
end

FactoryBot.define do
  factory :rental do
    code { 'CX0000' }
    start_date { Date.current }
    end_date { 1.week }
    client
    car_category
    user
    status { :scheduled }
  end
end

class CarModel < ApplicationRecord
  belongs_to :car_category
  belongs_to :manufacturer
end

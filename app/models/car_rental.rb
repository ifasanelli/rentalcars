class CarRental < ApplicationRecord
  belongs_to :rental
  belongs_to :car
  belongs_to :accessory


  def self.to_csv
    attributes = %w{ rental_code price car_category manufacturer car_model license_plate car_color subsidiary }
    csv = []
    CSV.generate(headers: true) do |row|
      row << attributes

      all.each do |car_rental|
        row << attributes.map{ |attr| car_rental.send(attr) }
      end
    end
  end

  def rental_code
    "#{rental.code}"
  end

  def manufacturer
    "#{car.car_model.manufacturer.name}"
  end

  def car_model
    "#{car.car_model.name}"
  end

  def license_plate
    "#{car.license_plate}"
  end

  def car_color
    "#{car.color}"
  end

  def subsidiary
    "#{car.subsidiary.name}"
  end

  def car_category
    "#{car.car_model.car_category.name}"
  end
end

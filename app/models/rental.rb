class Rental < ApplicationRecord
  belongs_to :client
  belongs_to :car_category
  belongs_to :user

  validate :start_date_cannot_be_in_the_past
  validate :end_date_cannot_be_before_start_date
  validate :must_have_available_cars

  enum status: { scheduled: 0, confirmed: 5 }

  private

  def start_date_cannot_be_in_the_past
    return errors.add(:start_date, 'Data inicial não pode ser antes de hoje') if start_date < Date.current
  end

  def end_date_cannot_be_before_start_date
    return errors.add(:end_date, 'Data final não pode ser antes da data inicial') if end_date < start_date
  end

  def must_have_available_cars
    return if cars_available?

    errors.add(:base, 'Não existem carros disponíveis desta categoria')
  end

  def scheduled_rentals
    Rental.where(car_category: car_category)
          .where(start_date: start_date..end_date)
          .or(Rental.where(car_category: car_category)
                    .where(end_date: start_date..end_date)
    )
  end

  def available_cars
    Car.where(status: :available)
       .joins(:car_model)
       .where(car_models: { car_category: car_category })
  end

  def cars_available?
    scheduled_rentals.count <= available_cars.count
  end
end

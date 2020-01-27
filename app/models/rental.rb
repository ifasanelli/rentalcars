class Rental < ApplicationRecord
  belongs_to :client
  belongs_to :car_category
  belongs_to :user

  validate :start_date_cannot_be_in_the_past
  validate :end_date_cannot_be_before_start_date

  enum status: { scheduled: 0, confirmed: 5 }
  

  def start_date_cannot_be_in_the_past
    if start_date < Date.current
      errors.add(:start_date, "Data inicial não pode ser antes de hoje")
    end
  end

  def end_date_cannot_be_before_start_date
    if end_date < start_date
      errors.add(:end_date, "Data final não pode ser antes da data inicial")
    end
  end


end

class CarCategory < ApplicationRecord
  has_many :car_models, dependent: :restrict_with_exception
  has_many :rentals, dependent: :restrict_with_exception

  validates :name, presence: {message: 'Nome não pode ficar em branco'}, uniqueness: {message: 'Categoria já existente'}
  validates :daily_rate, presence: {message: 'Diária não pode ficar em branco'}
  validates :car_insurance, presence: {message: 'Seguro não pode ficar em branco'}
  validates :third_party_insurance, presence: {message: 'Seguro para terceiros não pode ficar em branco'}

  def daily_price
    daily_rate + car_insurance + third_party_insurance
  end
end

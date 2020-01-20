class CarModel < ApplicationRecord
  belongs_to :car_category
  belongs_to :manufacturer

  validates :name, presence: {message: 'Nome não pode ficar em branco'}
  validates :motorization, presence: {message: 'Motorização não pode ficar em branco'}
  validates :year, presence: {message: 'Ano não pode ficar em branco'}
  validates :fuel_type, presence: {message: 'Tipo combustível não pode ficar em branco'}
end

class CarCategory < ApplicationRecord
    has_many :car_models
    has_many :rentals

    validates :name, presence: {message: 'Nome não pode ficar em branco'}, uniqueness: {message: 'Categoria já existente'}
    validates :daily_rate, presence: {message: 'Diária não pode ficar em branco'}
    validates :car_insurance, presence: {message: 'Seguro não pode ficar em branco'}
    validates :third_party_insurance, presence: {message: 'Seguro para terceiros não pode ficar em branco'}
end

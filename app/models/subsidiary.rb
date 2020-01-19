class Subsidiary < ApplicationRecord
    validates :name, presence: {message: 'Nome não pode ficar em branco'}, uniqueness: {message: 'Filial já existente'}
    validates :cnpj, presence: {message: 'CNPJ não pode ficar em branco'}, uniqueness: {message: 'CNPJ já existente'}
    validates :address, presence: {message: 'Endereço não pode ficar em branco'}
end

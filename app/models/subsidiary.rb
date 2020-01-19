class Subsidiary < ApplicationRecord
    validates :name, presence: {message: 'Nome não pode ficar em branco'}, uniqueness: {message: 'Filial já existente'}
    validates :cnpj, presence: {message: 'CNPJ não pode ficar em branco'}, uniqueness: {message: 'CNPJ já existente'}, format: { with: /\A\d{2}\.\d{3}\.\d{3}\/\d{4}\-\d{2}\z/, message: "CNPJ inválido! Formato correto: 11.111.111/1111-11" }
    validates :address, presence: {message: 'Endereço não pode ficar em branco'}
end

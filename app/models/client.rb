class Client < ApplicationRecord
    validates :name, presence: {message: 'Nome não pode ficar em branco'}
    validates :email, presence: {message: 'Email não pode ficar em branco'}, uniqueness: {message: 'Email já existente'}
    validates :cpf, presence: {message: 'CPF não pode ficar em branco'}, uniqueness: {message: 'CPF já existente'}

    def description
        "#{name} - #{cpf}"
    end
end

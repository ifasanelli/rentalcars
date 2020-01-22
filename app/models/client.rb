class Client < ApplicationRecord
    validates :name, presence: {message: 'Nome não pode ficar em branco'}
    validates :email, presence: {message: 'Email não pode ficar em branco'}, uniqueness: {message: 'Email já existente'}
    validates :cpf, presence: {message: 'CPF não pode ficar em branco'}, uniqueness: {message: 'CPF já existente'}, format: { with: /\A\d{3}\.\d{3}\.\d{3}\-\d{2}\z/, message: "CPF inválido! Formato correto: 111.111.111-11" }

    def description
        "#{name} - #{cpf}"
      end
    
end

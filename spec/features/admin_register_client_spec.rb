require 'rails_helper'

feature 'Admin register client' do
    scenario 'successfully' do
        user = User.create!(email: 'italo@italo.com', password:123456)
        visit root_path
        click_on 'Entrar'
        within 'form' do
            fill_in 'Email', with: 'italo@italo.com'
            fill_in 'Senha', with: '123456'
            click_on 'Entrar'
        end

        click_on 'Clientes'
        click_on 'Novo cliente'
        fill_in 'Nome', with: 'Italo Fasanelli'
        fill_in 'Email', with: 'italo@mail.com'
        fill_in 'CPF', with: '789.456.123-13'
        click_on 'Salvar'

        expect(page).to have_content('Italo Fasanelli')
        expect(page).to have_content('italo@mail.com')
        expect(page).to have_content('789.456.123-13')
        expect(page).to have_content('Voltar')
    end
end
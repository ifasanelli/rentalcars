require 'rails_helper'

feature 'Admin register manufacturer' do
    scenario 'successfully' do
        user = User.create!(email: 'italo@italo.com', password:123456)
        visit root_path
        click_on 'Entrar'
        within 'form' do
            fill_in 'Email', with: 'italo@italo.com'
            fill_in 'Senha', with: '123456'
            click_on 'Entrar'
        end

        click_on 'Fabricantes'
        click_on 'Novo fabricante'
        fill_in 'Nome:', with: 'Ferrari'
        click_on 'Salvar'

        expect(page).to have_content('Ferrari')
        expect(page).to have_content('Voltar')
    end
end
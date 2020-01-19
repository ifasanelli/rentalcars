require 'rails_helper'

feature 'Admin create car category' do
    scenario 'successfully' do
        user = User.create!(email: 'italo@italo.com', password:123456)
        visit root_path
        click_on 'Entrar'
        within 'form' do
            fill_in 'Email', with: 'italo@italo.com'
            fill_in 'Senha', with: '123456'
            click_on 'Entrar'
        end

        click_on 'Categorias'
        click_on 'Nova categoria'
        fill_in 'Nome', with: 'A'
        fill_in 'Diária', with: '100.95'
        fill_in 'Seguro', with: '50.95'
        fill_in 'Seguro para terceiros', with: '150.45'
        click_on 'Salvar'

        expect(page).to have_content('A')
        expect(page).to have_content('100.95')
        expect(page).to have_content('50.95')
        expect(page).to have_content('150.45')
        expect(page).to have_link('Voltar')
    end
end
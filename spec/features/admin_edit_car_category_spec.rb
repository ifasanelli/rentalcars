require 'rails_helper'

feature 'Admin edit car category' do
    scenario 'successfully' do
        CarCategory.create!(name: 'A',
                            daily_rate: 100.95,
                            car_insurance: 50.95,
                            third_party_insurance: 150.45)
        user = User.create!(email: 'italo@italo.com', password:123456)
        visit root_path
        click_on 'Entrar'
        within 'form' do
            fill_in 'Email', with: 'italo@italo.com'
            fill_in 'Senha', with: '123456'
            click_on 'Entrar'
        end

        click_on 'Categorias'
        click_on "A"
        click_on "Editar"
        fill_in 'Nome', with: 'AAAA'
        fill_in 'Diária', with: '400.95'
        fill_in 'Seguro', with: '300.95 '
        fill_in 'Seguro para terceiros', with: '400.45'
        click_on 'Salvar'

        expect(page).to have_content('AAA')
        expect(page).to have_content('400.95')
        expect(page).to have_content('300.95')
        expect(page).to have_content('400.45')
        expect(page).to have_link('Voltar')
    end
end
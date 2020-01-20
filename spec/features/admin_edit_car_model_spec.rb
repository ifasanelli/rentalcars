require 'rails_helper'

feature 'Admin edit car model' do
    scenario 'seccessfully' do
        categoria = CarCategory.create!(name: 'A',
            daily_rate: 100.95,
            car_insurance: 50.95,
            third_party_insurance: 150.45)
        fabricante = Manufacturer.create!(name: 'Fiat')
        CarModel.create!(name: 'Palio', 
                motorization: '1.0', 
                year: '2016',
                fuel_type: 'Gasolina',
                car_category: categoria,
                manufacturer: fabricante)
        User.create!(email: 'italo@italo.com', password:123456)
        visit root_path
        click_on 'Entrar'
        within 'form' do
            fill_in 'Email', with: 'italo@italo.com'
            fill_in 'Senha', with: '123456'
            click_on 'Entrar'
        end

        click_on 'Modelos'
        click_on 'Palio'
        click_on 'Editar'
        fill_in 'Nome', with: 'Sienna'
        fill_in 'Motorização', with: '1.6'
        fill_in 'Ano', with: '2010'
        fill_in 'Tipo combustível', with: 'Gasolina'
        select 'A', from: 'Categoria'
        select 'Fiat', from: 'Fabricante'
        click_on 'Salvar'

        expect(page).to have_content('Sienna')
        expect(page).to have_content('2010')
        expect(page).to have_content('1.6')
        expect(page).to have_content('Gasolina')
        expect(page).to have_content(/A/)
        expect(page).to have_content('Fiat')
    end
end
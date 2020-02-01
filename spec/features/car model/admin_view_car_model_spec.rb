require 'rails_helper'

feature 'Admin view car model' do
    scenario 'successfully' do
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
        CarModel.create!(name: 'Punto', 
                        motorization: '1.6', 
                        year: '2018',
                        fuel_type: 'Gasolina',
                        car_category: categoria,
                        manufacturer: fabricante)
        user = User.create!(email: 'italo@italo.com', password:123456)
        visit root_path
        click_on 'Entrar'
        within 'form' do
            fill_in 'Email', with: 'italo@italo.com'
            fill_in 'Senha', with: '123456'
            click_on 'Entrar'
        end

        click_on 'Modelos'

        expect(page).to have_content('Palio')
        expect(page).to have_content('1.0')
        expect(page).to have_content('2016')
        expect(page).to have_content('Gasolina')
        expect(page).to have_content('Punto')
        expect(page).to have_content('1.6')
        expect(page).to have_content('2018')
        expect(page).to have_content('Gasolina')
        expect(page).to have_link('Voltar')
    end

    scenario 'and view car model details' do
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
        CarModel.create!(name: 'Punto', 
                motorization: '1.6', 
                year: '2018',
                fuel_type: 'Gasolina',
                car_category: categoria,
                manufacturer: fabricante)
        user = User.create!(email: 'italo@italo.com', password:123456)
        visit root_path
        click_on 'Entrar'
        within 'form' do
        fill_in 'Email', with: 'italo@italo.com'
        fill_in 'Senha', with: '123456'
        click_on 'Entrar'
        end

        click_on 'Modelos'
        click_on 'Palio'

        expect(page).to have_content('Palio')
        expect(page).to have_content('1.0')
        expect(page).to have_content('2016')
        expect(page).to have_content('Gasolina')
        expect(page).to_not have_content('Punto')
        expect(page).to_not have_content('1.6')
        expect(page).to_not have_content('2018')
        expect(page).to have_link('Voltar')
    end
end
require 'rails_helper'

feature 'User view cars' do
    scenario 'successfully' do
        user = User.create!(email: 'italo@italo.com', password:123456)
        manufacturer = Manufacturer.create(name: 'Fiat')
        car_category = CarCategory.create!(name: 'A', 
                                           daily_rate: 95.98, 
                                           car_insurance: 30.45, 
                                           third_party_insurance: 22.99)
        car_model = CarModel.create!(name: 'Palio', 
                                     year: '2017', 
                                     manufacturer: manufacturer, 
                                     motorization: '1.6', 
                                     car_category: car_category, 
                                     fuel_type: 'Gasolina')
        other_car_model = CarModel.create!(name: 'Punto', 
                                           year: '2019', 
                                           manufacturer: manufacturer, 
                                           motorization: '1.8', 
                                           car_category: car_category, 
                                           fuel_type: 'Gasolina')
        subsidiary = Subsidiary.create!(name: 'Filial Santos', 
                                        cnpj: '37645468000143', 
                                        address: 'Rua dos Santos, 13')
        other_subsidiary = Subsidiary.create!(name: 'Filial Osasco', 
                                              cnpj: '70976813000105', 
                                              address: 'Rua de Osasco, 14')
        car = Car.create!(license_plate: 'ABC-1234', 
                          color: 'Prata', 
                          car_model: car_model, 
                          mileage: '180', 
                          subsidiary: subsidiary,
                          status: 0)
        other_car = Car.create!(license_plate: 'DEF-5678', 
                                color: 'Branco', 
                                car_model: other_car_model, 
                                mileage: '40', 
                                subsidiary: other_subsidiary,
                                status: 5)

        login_as(user, scope: :user)
        visit root_path
        click_on 'Carros'
    
        expect(page).to have_content('ABC-1234')
        expect(page).to have_content('Prata')
        expect(page).to have_content('Punto')
        expect(page).to have_content('180')
        expect(page).to have_content('Filial Santos')

        expect(page).to have_content('DEF-5678')
        expect(page).to have_content('Branco')
        expect(page).to have_content('Palio')
        expect(page).to have_content('40')
        expect(page).to have_content('Filial Osasco')
    end
end
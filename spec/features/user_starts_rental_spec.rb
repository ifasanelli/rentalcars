require 'rails_helper'

feature 'User starts rental' do
    scenario 'successfully' do
        user = User.create!(email: 'italo@email.com', password: '123456')
        client = Client.create!(name: 'Mariana', cpf: '123.456.789-10', email: 'mari@gmail.com')
        other_client = Client.create!(name: 'Lúcia', cpf: '123.456.789-20', email: 'lucia@gmail.com')
        car_category = CarCategory.create!(name: 'A', daily_rate: 100.99, car_insurance: 30.54, third_party_insurance: 20.45)
        rental = Rental.create!(code: 'CA001', start_date: Date.current, end_date: 7.day.from_now, client: client, car_category: car_category, user: user)
        Rental.create!(code: 'CA002', start_date: Date.current, end_date: 10.day.from_now, client: other_client, car_category: car_category, user: user)
        manufacturer = Manufacturer.create(name: 'Fiat')
        car_model = CarModel.create!(name: 'Palio', year: '2017', manufacturer: manufacturer, motorization: '1.6', car_category: car_category, fuel_type: 'Gasolina')
        car = Car.create!(license_plate: 'ABC-1234', color: 'Prata', car_model: car_model, mileage: '180')
        

        login_as(user, scope: :user)
        visit root_path
        click_on 'Locações'
        fill_in 'Buscar locação por código', with: 'CA001'
        click_on 'Buscar'
        click_on 'CA001'
        click_on 'Efetivar locação'
        

        select 'ABC-1234', from: 'Carro'
        click_on 'Efetivar locação'
      
        #Assert
        expect(page).to have_content("CA001")
        expect(page).to have_content('Fiat / Palio - ABC-1234 - Prata')
    end
end

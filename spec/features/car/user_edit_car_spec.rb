require 'rails_helper'

feature 'User edits a car' do
  scenario 'seccessfully' do
    user = User.create!(email: 'italo@italo.com', password:123_456)
    manufacturer = Manufacturer.create(name: 'Fiat')
    car_category = CarCategory.create!(name: 'A', daily_rate: 95.98, car_insurance: 30.45, third_party_insurance: 22.99)
    car_model = CarModel.create!(name: 'Palio', year: '2017', manufacturer: manufacturer, motorization: '1.6', car_category: car_category, fuel_type: 'Gasolina')
    subsidiary = Subsidiary.create!(name: 'Filial Santos', cnpj: '37645468000143', address: 'Rua dos Santos, 13')
    Car.create!(license_plate: 'ABC-1234', color: 'Prata', car_model: car_model, mileage: '180',  subsidiary: subsidiary, status: 0)

    login_as(user, scope: :user)
    visit root_path
    click_on 'Carros'
    click_on 'Palio'
    click_on 'Editar'
    fill_in 'Placa', with: 'CBA-4321'
    fill_in 'Cor', with: 'Preto'
    fill_in 'Quilometragem', with: '60'
    select 'Palio', from: 'Modelo'
    select 'Filial Santos', from: 'Filial'
    click_on 'Salvar'

    expect(page).to have_content('CBA-4321')
    expect(page).to have_content('Preto')
    expect(page).to have_content('Palio')
    expect(page).to have_content('60')
    expect(page).to have_content('Filial Santos')
  end
end

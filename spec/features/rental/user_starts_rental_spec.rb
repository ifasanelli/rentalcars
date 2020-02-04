require 'rails_helper'

feature 'User starts rental' do
    scenario 'successfully' do
        user = create(:user)
        client = create(:client, name: 'Mariana', cpf: '123.456.789-10', email: 'mari@gmail.com')
        car_category = create(:car_category, name: 'A', daily_rate: 95.98, car_insurance: 30.45, third_party_insurance: 22.99)
        subsidiary = create(:subsidiary, name: 'Santos', cnpj: '43425661000171', address: 'Rua de Santos, 13')
        manufacturer = create(:manufacturer, name: 'Fiat')
        create(:car_model, name: 'Palio', motorization: '1.6', year: '2020', fuel_type: 'Gasolina', car_category_id: car_category.id, manufacturer_id: manufacturer.id)
        create(:car, license_plate: 'ABC-1234', color: 'Vermelho', car_model_id: car_category.id, mileage: 0, status: 0, subsidiary_id: subsidiary.id)
        create(:car, license_plate: 'AAA-4321', color: 'Roxo', car_model_id: car_category.id, mileage: 0, status: 0, subsidiary_id: subsidiary.id)
        rental = create(:rental, start_date: 1.day.from_now, end_date: 5.days.from_now, client: client, car_category: car_category, user: user)
        login_as(user, scope: :user)
        visit root_path

        click_on 'Locações'
        click_on 'Agendar locação'
        fill_in 'Data inicial', with: '20/04/2040'
        fill_in 'Data final', with: '20/05/2040'
        select 'Mariana - 123.456.789-10', from: 'Cliente'
        select 'A', from: 'Categoria'
        click_on 'Agendar'
        click_on 'Efetivar locação'
        select 'ABC-1234', from: 'Carro'
        click_on 'Efetivar locação'

        #Assert
        expect(page).to have_content('ABC-1234')
    end
end

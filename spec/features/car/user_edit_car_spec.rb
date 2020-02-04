require 'rails_helper'

feature 'User edits a car' do
  scenario 'seccessfully' do
    user = create(:user)
    manufacturer = create(:manufacturer, name: 'Volkswagen')
    car_category = create(:car_category, name: 'AA')
    car_model = create(:car_model, name: 'Punto', manufacturer: manufacturer, car_category: car_category)
    create(:car, car_model: car_model)
    create(:subsidiary, name: 'Filial Ipiranga', cnpj: '07512112000170')

    login_as(user, scope: :user)
    visit root_path
    click_on 'Carros'
    click_on 'Punto'
    click_on 'Editar'
    fill_in 'Placa', with: 'ABC-4321'
    fill_in 'Cor', with: 'Preto'
    fill_in 'Quilometragem', with: '60'
    select 'Punto', from: 'Modelo'
    select 'Filial Ipiranga', from: 'Filial'
    click_on 'Salvar'

    expect(page).to have_content('ABC-4321')
    expect(page).to have_content('Preto')
    expect(page).to have_content('Punto')
    expect(page).to have_content('60')
    expect(page).to have_content('Filial Ipiranga')
  end
end

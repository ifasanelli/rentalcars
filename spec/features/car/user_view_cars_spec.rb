require 'rails_helper'

feature 'User view cars' do
  scenario 'successfully' do
    user = create(:user)
    manufacturer = create(:manufacturer)
    car_category = create(:car_category)
    car_model = create(:car_model, name: 'Uno', manufacturer: manufacturer, car_category: car_category)
    other_car_model = create(:car_model, name: 'Punto', manufacturer: manufacturer, car_category: car_category)
    subsidiary = create(:subsidiary)
    other_subsidiary = create(:subsidiary, name: 'Filial Osasco', cnpj: '70976813000105', address: 'Rua de Osasco, 14')
    create(:car, license_plate: 'ABC-1234', color: 'Prata', car_model: car_model, subsidiary: subsidiary)
    create(:car, license_plate: 'DEF-5678', color: 'Branco', car_model: other_car_model, subsidiary: other_subsidiary, status: 5)

    login_as(user, scope: :user)
    visit root_path
    click_on 'Carros'

    expect(page).to have_content('ABC-1234')
    expect(page).to have_content('Prata')
    expect(page).to have_content('Uno')
    expect(page).to have_content('200')
    expect(page).to have_content('Filial Santos')

    expect(page).to have_content('DEF-5678')
    expect(page).to have_content('Branco')
    expect(page).to have_content('Punto')
    expect(page).to have_content('200')
    expect(page).to have_content('Filial Osasco')
  end
end

require 'rails_helper'

feature 'Admin view car model' do
  scenario 'successfully' do
    car_category = create(:car_category)
    manufacturer = create(:manufacturer)
    create(:car_model, name: 'Palio', motorization: '1.0', year: '2016', fuel_type: 'Gasolina', car_category: car_category, manufacturer: manufacturer)
    create(:car_model, name: 'Punto', motorization: '1.6', year: '2018', fuel_type: 'Gasolina', car_category: car_category, manufacturer: manufacturer)
    user = create(:user)
    login_as(user, scope: :user)
    visit root_path

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
    car_category = create(:car_category)
    manufacturer = create(:manufacturer)
    create(:car_model, name: 'Palio', motorization: '1.0', year: '2016', fuel_type: 'Gasolina', car_category: car_category, manufacturer: manufacturer)
    create(:car_model, name: 'Punto', motorization: '1.6', year: '2018', fuel_type: 'Gasolina', car_category: car_category, manufacturer: manufacturer)
    user = create(:user)
    login_as(user, scope: :user)
    visit root_path

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

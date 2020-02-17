require 'rails_helper'

feature 'Admin edit car model' do
  scenario 'seccessfully' do
    car_category = create(:car_category)
    manufacturer = create(:manufacturer)
    create(:car_model, name: 'Palio', motorization: '1.0', year: '2016', fuel_type: 'Gasolina', car_category: car_category, manufacturer: manufacturer)
    user = create(:user)
    login_as(user, scope: :user)
    visit root_path

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
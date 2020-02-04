require 'rails_helper'

feature 'Admin register a car' do
  scenario 'seccessfully' do
    user = create(:user)
    create(:car_model)
    create(:subsidiary)

    login_as(user, scope: :user)
    visit root_path
    click_on 'Carros'
    click_on 'Novo carro'
    fill_in 'Placa', with: 'CBA-4321'
    fill_in 'Cor', with: 'Preto'
    fill_in 'Quilometragem', with: '20'
    select 'Palio', from: 'Modelo'
    select 'Filial Santos', from: 'Filial'
    click_on 'Salvar'

    expect(page).to have_content('CBA-4321')
    expect(page).to have_content('Preto')
    expect(page).to have_content('Palio')
    expect(page).to have_content('20')
    expect(page).to have_content('Filial Santos')
  end
end

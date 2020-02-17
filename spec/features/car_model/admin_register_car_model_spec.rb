require 'rails_helper'

feature 'Admin register car model' do
  scenario 'successfully' do
    create(:car_category)
    create(:manufacturer)
    user = create(:user)
    login_as(user, scope: :user)
    visit root_path

    click_on 'Modelos'
    click_on 'Novo modelo'
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
  scenario 'and validates empty fields' do
    create(:car_category)
    create(:manufacturer)
    user = create(:user)
    login_as(user, scope: :user)
    visit root_path

    click_on 'Modelos'
    click_on 'Novo modelo'
    fill_in 'Nome', with: ''
    fill_in 'Motorização', with: ''
    fill_in 'Ano', with: ''
    fill_in 'Tipo combustível', with: ''
    select 'A', from: 'Categoria'
    select 'Fiat', from: 'Fabricante'
    click_on 'Salvar'

    expect(page).to have_content('Você deve corrigir os erros para continuar')
    expect(page).to have_content('Nome não pode ficar em branco')
    expect(page).to have_content('Motorização não pode ficar em branco')
    expect(page).to have_content('Ano não pode ficar em branco')
    expect(page).to have_content('Tipo combustível não pode ficar em branco')
  end
end
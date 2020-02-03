require 'rails_helper'

feature 'Admin edit manufacturer' do
  scenario 'successfully' do
    Manufacturer.create!(name: 'Fiat')
    Manufacturer.create!(name: 'Volkswagen')
    User.create!(email: 'italo@italo.com', password:123_456)
    visit root_path
    click_on 'Entrar'
    within 'form' do
    fill_in 'Email', with: 'italo@italo.com'
    fill_in 'Senha', with: '123456'
    click_on 'Entrar'
    end

    click_on 'Fabricantes'
    click_on 'Fiat'
    click_on 'Editar'
    fill_in 'Nome:', with: 'Ferrari'
    click_on 'Salvar'

    expect(page).to have_content('Ferrari')
    expect(page).to_not have_content('Fiat')
    expect(page).to have_link('Voltar')
  end

  scenario 'and validates empty fields' do
    Manufacturer.create!(name: 'Fiat')
    User.create!(email: 'italo@italo.com', password:123_456)
    visit root_path
    click_on 'Entrar'
    within 'form' do
    fill_in 'Email', with: 'italo@italo.com'
    fill_in 'Senha', with: '123456'
    click_on 'Entrar'
    end

    click_on 'Fabricantes'
    click_on 'Fiat'
    click_on 'Editar'
    fill_in 'Nome:', with: ''
    click_on 'Salvar'

    expect(page).to have_content('Você deve corrigir os erros para continuar')
    expect(page).to have_content('Nome não pode ficar em branco')
  end
end
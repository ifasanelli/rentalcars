require 'rails_helper'

feature 'Admin view manufactures' do
  scenario 'successfully' do
    Manufacturer.create!(name: 'Fiat')
    Manufacturer.create!(name: 'Volkswagen')
    Manufacturer.create!(name: 'Volvo')
    User.create!(email: 'italo@italo.com', password:123_456)
    visit root_path
    click_on 'Entrar'
    within 'form' do
      fill_in 'Email', with: 'italo@italo.com'
      fill_in 'Senha', with: '123456'
      click_on 'Entrar'
    end

    click_on 'Fabricantes'

    expect(page).to have_content('Fiat')
    expect(page).to have_content('Volkswagen')
    expect(page).to have_content('Volvo')
    expect(page).to have_link('Voltar')
  end

  scenario 'and see manufacturer details' do
    Manufacturer.create!(name: 'Fiat')
    Manufacturer.create!(name: 'Volkswagen')
    Manufacturer.create!(name: 'Volvo')
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

    expect(page).to have_content('Fiat')
    expect(page).to have_link('Voltar')
  end
end
require 'rails_helper'

feature 'Admin view car category' do
  scenario 'successfully' do
    CarCategory.create!(name: 'A', daily_rate: 100.95, car_insurance: 50.95, third_party_insurance: 150.45)
    CarCategory.create!(name: 'AA', daily_rate: 200.95, car_insurance: 100.95, third_party_insurance: 200.45)
    CarCategory.create!(name: 'AAA', daily_rate: 300.95, car_insurance: 200.95, third_party_insurance: 300.45)
    User.create!(email: 'italo@italo.com', password:123_456)
    visit root_path
    click_on 'Entrar'
    within 'form' do
      fill_in 'Email', with: 'italo@italo.com'
      fill_in 'Senha', with: '123456'
      click_on 'Entrar'
    end

    click_on 'Categorias'

    expect(page).to have_content('A')
    expect(page).to have_content('100.95')
    expect(page).to have_content('50.95')
    expect(page).to have_content('150.45')
    expect(page).to have_content('AA')
    expect(page).to have_content('200.95')
    expect(page).to have_content('100.95')
    expect(page).to have_content('200.45')
    expect(page).to have_content('AAA')
    expect(page).to have_content('300.95')
    expect(page).to have_content('200.95')
    expect(page).to have_content('300.45')
    expect(page).to have_link('Voltar')
  end

  scenario 'and see manufacturer details' do
    CarCategory.create!(name: 'A',
    daily_rate: 100.95,
    car_insurance: 50.95,
    third_party_insurance: 150.45)
    User.create!(email: 'italo@italo.com', password:123_456)
    visit root_path
    click_on 'Entrar'
    within 'form' do
      fill_in 'Email', with: 'italo@italo.com'
      fill_in 'Senha', with: '123456'
      click_on 'Entrar'
    end

    click_on 'Categorias'
    click_on 'A'

    expect(page).to have_content('A')
    expect(page).to have_content('100.95')
    expect(page).to have_content('50.95')
    expect(page).to have_content('150.45')
    expect(page).to have_link('Voltar')
  end
end

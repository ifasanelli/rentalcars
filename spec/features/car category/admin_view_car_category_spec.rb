require 'rails_helper'

feature 'Admin view car category' do
  scenario 'successfully' do
    create(:car_category, name: 'A', daily_rate: 100.95, car_insurance: 50.95, third_party_insurance: 150.45)
    create(:car_category, name: 'AA', daily_rate: 200.95, car_insurance: 100.95, third_party_insurance: 200.45)
    create(:car_category, name: 'AAA', daily_rate: 300.95, car_insurance: 200.95, third_party_insurance: 300.45)
    user = create(:user)
    login_as(user, scope: :user)
    visit root_path

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
    create(:car_category, name: 'A', daily_rate: 100.95, car_insurance: 50.95, third_party_insurance: 150.45)
    user = create(:user)
    login_as(user, scope: :user)
    visit root_path

    click_on 'Categorias'
    click_on 'A'

    expect(page).to have_content('A')
    expect(page).to have_content('100.95')
    expect(page).to have_content('50.95')
    expect(page).to have_content('150.45')
    expect(page).to have_link('Voltar')
  end
end

require 'rails_helper'

feature 'Admin view manufactures' do
  scenario 'successfully' do
    create(:manufacturer)
    create(:manufacturer, name: 'Volkswagen')
    create(:manufacturer, name: 'Volvo')
    user = create(:user)
    login_as(user, scope: :user)
    visit root_path

    click_on 'Fabricantes'

    expect(page).to have_content('Fiat')
    expect(page).to have_content('Volkswagen')
    expect(page).to have_content('Volvo')
    expect(page).to have_link('Voltar')
  end

  scenario 'and see manufacturer details' do
    create(:manufacturer)
    create(:manufacturer, name: 'Volkswagen')
    create(:manufacturer, name: 'Volvo')
    user = create(:user)
    login_as(user, scope: :user)
    visit root_path

    click_on 'Fabricantes'
    click_on 'Fiat'

    expect(page).to have_content('Fiat')
    expect(page).to have_link('Voltar')
  end
end
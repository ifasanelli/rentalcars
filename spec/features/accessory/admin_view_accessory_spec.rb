require 'rails_helper'

feature 'Admin view accessories' do
  scenario 'successfully' do
    user = create(:user)
    create(:accessory)
    create(:accessory, name: 'Cadeira para bebês', full_description: 'Cadeira ajustável para bebês de 0 a 2 anos', price: 29.99)
    login_as(user, scope: :user)
    visit root_path

    click_on 'Acessórios'

    expect(page).to have_content('Cadeira infantil')
    expect(page).to have_content('Cadeira ajustável para crianças de 3 a 7 anos')
    expect(page).to have_content('39.99')
    expect(page).to have_content('Cadeira para bebês')
    expect(page).to have_content('Cadeira ajustável para bebês de 0 a 2 anos')
    expect(page).to have_content('29.99')
  end

  scenario 'and view accessory details' do
    user = create(:user)
    create(:accessory)
    login_as(user, scope: :user)
    visit root_path

    click_on 'Acessórios'
    click_on 'Cadeira infantil'

    expect(page).to have_content('Cadeira infantil')
    expect(page).to have_content('Cadeira ajustável para crianças de 3 a 7 anos')
    expect(page).to have_content('39.99')
  end
end

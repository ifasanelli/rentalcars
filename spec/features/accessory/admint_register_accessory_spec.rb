require 'rails_helper'

feature 'Admin register accessory' do
  scenario 'successfully' do

    user = create(:user)
    login_as(user, scope: :user)
    visit root_path

    click_on 'Acessórios'
    click_on 'Novo acessório'
    fill_in 'Nome', with: 'Cadeirão'
    fill_in 'Descrição', with: 'Cadeirão para crianças de 3 a 7 anos'
    fill_in 'Preço', with: '39.95'
    click_on 'Salvar'

    expect(page).to have_content('Cadeirão')
    expect(page).to have_content('Cadeirão para crianças de 3 a 7 anos')
    expect(page).to have_content('39.95')
  end
end
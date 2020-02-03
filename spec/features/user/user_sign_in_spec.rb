require 'rails_helper'

feature 'User sign in' do
  scenario 'from home page' do
    user = User.create!(email: 'italo@italo.com', password:123_456)

    visit root_path
    click_on 'Entrar'

    within 'form' do
      fill_in 'Email', with: 'italo@italo.com'
      fill_in 'Senha', with: '123456'
      click_on 'Entrar'
      end

    expect(current_path).to eq(root_path)
    expect(page).to have_content('Signed in successfully')
    expect(page).to have_content('Sair')
    expect(page).to_not have_content('Entrar')
    expect(page).to have_content("Olá, #{user.email}")
  end

  scenario 'successfully' do
    User.create!(email: 'italo@italo.com', password: '123456')

    visit root_path
    click_on 'Entrar'

    within 'form' do
      fill_in 'Email', with: 'italo@italo.com'
      fill_in 'Senha', with: '123456'
      click_on 'Entrar'
    end
    click_on 'Sair'

    expect(page).to have_content('Signed out successfully')
    expect(page).not_to have_link('Sair')
    expect(page).to have_link('Entrar')
    expect(current_path).to eq(root_path)
  end
end

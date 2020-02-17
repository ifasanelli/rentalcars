require 'rails_helper'

feature 'User sign in' do
  scenario 'from home page' do
    user = create(:user)
    visit root_path

    within 'form' do
      fill_in 'Email', with: 'it@it.com'
      fill_in 'Senha', with: '123456'
      click_on 'Entrar'
      end

    expect(current_path).to eq(root_path)
    expect(page).to have_content('Signed in successfully')
    expect(page).to have_content('Sair')
    expect(page).to_not have_content('Entrar')
    expect(page).to have_content("#{user.email}")
  end

  scenario 'successfully' do
    user = create(:user)
    visit root_path

    within 'form' do
      fill_in 'Email', with: 'it@it.com'
      fill_in 'Senha', with: '123456'
      click_on 'Entrar'
      end
    click_on 'Sair'

    expect(page).to have_content('Log in')
    expect(page).not_to have_link('Sair')
    expect(page).to have_content('Email')
    expect(page).to have_content('Senha')
  end
end

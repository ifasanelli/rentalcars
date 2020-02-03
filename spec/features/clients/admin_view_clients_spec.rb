require 'rails_helper'

feature 'Admin view clients' do
  scenario 'seccessfully' do
    Client.create!(name: 'Mariana Santana', email: 'mari@email.com', cpf: '123.123.123-12')
    Client.create!(name: 'Thatiana Leomil', email: 'thati@email.com', cpf: '321.321.312-32')
    User.create!(email: 'italo@italo.com', password:123_456)
    visit root_path
    click_on 'Entrar'
    within 'form' do
      fill_in 'Email', with: 'italo@italo.com'
      fill_in 'Senha', with: '123456'
      click_on 'Entrar'
    end

    click_on 'Clientes'

    expect(page).to have_content('Mariana Santana')
    expect(page).to have_content('mari@email.com')
    expect(page).to have_content('123.123.123-12')
    expect(page).to have_content('Thatiana Leomil')
    expect(page).to have_content('thati@email.com')
    expect(page).to have_content('321.321.312-32')
    expect(page).to have_content('Voltar')
  end
  scenario 'and view client details' do
    Client.create!(name: 'Mariana Santana', email: 'mari@email.com', cpf: '123.123.123-12')
    Client.create!(name: 'Thatiana Leomil', email: 'thati@email.com', cpf: '321.321.312-32')
    User.create!(email: 'italo@italo.com', password:123_456)
    visit root_path
    click_on 'Entrar'
    within 'form' do
      fill_in 'Email', with: 'italo@italo.com'
      fill_in 'Senha', with: '123456'
      click_on 'Entrar'
    end

    click_on 'Clientes'
    click_on 'Mariana Santana'

    expect(page).to have_content('Mariana Santana')
    expect(page).to have_content('mari@email.com')
    expect(page).to have_content('123.123.123-12')
    expect(page).to_not have_content('Thatiana Leomil')
    expect(page).to_not have_content('thati@email.com')
    expect(page).to_not have_content('321.321.312-32')
    expect(page).to have_content('Voltar')
  end
end
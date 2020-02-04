require 'rails_helper'

feature 'Admin edit client' do
  scenario 'successfully' do
    create(:client, name: 'Mariana Santana', email: 'mari@email.com', cpf: '123.123.123-12')
    user = create(:user)
    login_as(user, scope: :user)
    visit root_path

    click_on 'Clientes'
    click_on 'Mariana Santana'
    click_on 'Editar'
    fill_in 'Nome', with: 'Mariana Fasanelli'
    fill_in 'Email', with: 'mari@mail.com'
    fill_in 'CPF', with: '123.321.123-99'
    click_on 'Salvar'

    expect(page).to have_content('Mariana Fasanelli')
    expect(page).to have_content('mari@mail.com')
    expect(page).to have_content('123.321.123-99')
    expect(page).to have_link('Voltar')
  end
  scenario 'and validates empty fields' do
    create(:client, name: 'Mariana Santana', email: 'mari@email.com', cpf: '123.123.123-12')
    user = create(:user)
    login_as(user, scope: :user)
    visit root_path

    click_on 'Clientes'
    click_on 'Mariana Santana'
    click_on 'Editar'
    fill_in 'Nome', with: ''
    fill_in 'Email', with: ''
    fill_in 'CPF', with: ''
    click_on 'Salvar'

    expect(page).to have_content('Você deve corrigir os erros para continuar')
    expect(page).to have_content('Nome não pode ficar em branco')
    expect(page).to have_content('Email não pode ficar em branco')
    expect(page).to have_content('CPF não pode ficar em branco')
  end
end
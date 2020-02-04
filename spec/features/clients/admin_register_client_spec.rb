require 'rails_helper'

feature 'Admin register client' do
  scenario 'successfully' do
    user = create(:user)
    login_as(user, scope: :user)
    visit root_path

    click_on 'Clientes'
    click_on 'Novo cliente'
    fill_in 'Nome', with: 'Italo Fasanelli'
    fill_in 'Email', with: 'italo@mail.com'
    fill_in 'CPF', with: '789.456.123-13'
    click_on 'Salvar'

    expect(page).to have_content('Italo Fasanelli')
    expect(page).to have_content('italo@mail.com')
    expect(page).to have_content('789.456.123-13')
    expect(page).to have_content('Voltar')
  end

  scenario 'and validates empty fields' do
    user = create(:user)
    login_as(user, scope: :user)
    visit root_path

    click_on 'Clientes'
    click_on 'Novo cliente'
    fill_in 'Nome', with: ''
    fill_in 'Email', with: ''
    fill_in 'CPF', with: ''
    click_on 'Salvar'

    expect(page).to have_content('Você deve corrigir os erros para continuar')
    expect(page).to have_content('Nome não pode ficar em branco')
    expect(page).to have_content('Email não pode ficar em branco')
    expect(page).to have_content('CPF não pode ficar em branco')
  end
  scenario 'and validates duplicated fields' do
    create(:client, name: 'Mariana Santana', email: 'mari@email.com', cpf: '123.123.123-12')
    user = create(:user)
    login_as(user, scope: :user)
    visit root_path

    click_on 'Clientes'
    click_on 'Novo cliente'
    fill_in 'Nome', with: 'Mariana Santana'
    fill_in 'Email', with: 'mari@email.com'
    fill_in 'CPF', with: '123.123.123-12'
    click_on 'Salvar'

    expect(page).to have_content('Você deve corrigir os erros para continuar:')
    expect(page).to have_content('Email já existente')
    expect(page).to have_content('CPF já existente')
  end
end
require 'rails_helper'

feature 'Admin view subsidiary' do
  scenario 'seccessfully' do
    create(:subsidiary, name: 'Baixada Santista', cnpj: '70047047000196', address: 'Rua dos Santos, 13')
    user = create(:user)
    login_as(user, scope: :user)
    visit root_path

    click_on 'Filiais'
    click_on 'Baixada Santista'
    click_on 'Editar'
    fill_in 'Nome', with: 'Santos'
    click_on 'Salvar'

    expect(page).to have_content('Santos')
    expect(page).to have_content('70047047000196')
    expect(page).to have_content('Rua dos Santos, 13')
    expect(page).to have_content('Voltar')
  end

  scenario 'and validates empty fields' do
    create(:subsidiary, name: 'Baixada Santista', cnpj: '70047047000196', address: 'Rua dos Santos, 13')
    user = create(:user)
    login_as(user, scope: :user)
    visit root_path

    click_on 'Filiais'
    click_on 'Baixada Santista'
    click_on 'Editar'
    fill_in 'Nome', with: ''
    fill_in 'CNPJ', with: ''
    fill_in 'Endereço', with: ''
    click_on 'Salvar'

    expect(page).to have_content('Você deve corrigir os erros para continuar')
    expect(page).to have_content('Nome não pode ficar em branco')
    expect(page).to have_content('CNPJ não pode ficar em branco')
    expect(page).to have_content('Endereço não pode ficar em branco')
  end
  scenario 'and validates cnpj' do
    create(:subsidiary, name: 'Baixada Santista', cnpj: '70047047000196', address: 'Rua dos Santos, 13')
    user = create(:user)
    login_as(user, scope: :user)
    visit root_path

    click_on 'Filiais'
    click_on 'Baixada Santista'
    click_on 'Editar'
    fill_in 'Nome', with: 'Baixada Santista'
    fill_in 'CNPJ', with: '13131313000113'
    fill_in 'Endereço', with: 'Rua da Baixada,131'
    click_on 'Salvar'

    expect(page).to have_content('Você deve corrigir os erros para continuar:')
    expect(page).to have_content('Cnpj inválido!')
  end
end

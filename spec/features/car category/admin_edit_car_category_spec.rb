require 'rails_helper'

feature 'Admin edit car category' do
  scenario 'successfully' do
    create(:car_category)
    user = create(:user)

    login_as(user, scope: :user)
    visit root_path
    click_on 'Categorias'
    click_on 'A'
    click_on 'Editar'
    fill_in 'Nome', with: 'AAA'
    fill_in 'Diária', with: '400.95'
    fill_in 'Seguro', with: '300.95 '
    fill_in 'Seguro para terceiros', with: '400.45'
    click_on 'Salvar'

    expect(page).to have_content('AAA')
    expect(page).to have_content('400.95')
    expect(page).to have_content('300.95')
    expect(page).to have_content('400.45')
    expect(page).to have_link('Voltar')
  end
  scenario 'and validates empty fields' do
    create(:car_category)
    user = create(:user)

    login_as(user, scope: :user)
    visit root_path
    click_on 'Categorias'
    click_on 'A'
    click_on 'Editar'
    fill_in 'Nome', with: ''
    fill_in 'Diária', with: ''
    fill_in 'Seguro', with: ''
    fill_in 'Seguro para terceiros', with: ''
    click_on 'Salvar'

    expect(page).to have_content('Você deve corrigir os erros para continuar')
    expect(page).to have_content('Nome não pode ficar em branco')
    expect(page).to have_content('Diária não pode ficar em branco')
    expect(page).to have_content('Seguro não pode ficar em branco')
    expect(page).to have_content('Seguro para terceiros não pode ficar em branco')
  end
end

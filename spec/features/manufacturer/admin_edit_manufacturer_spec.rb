require 'rails_helper'

feature 'Admin edit manufacturer' do
  scenario 'successfully' do
    create(:manufacturer, name: 'Fiat')
    create(:manufacturer, name: 'Volkswagen')
    user = create(:user)
    login_as(user, scope: :user)
    visit root_path

    click_on 'Fabricantes'
    click_on 'Fiat'
    click_on 'Editar'
    fill_in 'Nome:', with: 'Ferrari'
    click_on 'Salvar'

    expect(page).to have_content('Ferrari')
    expect(page).to_not have_content('Fiat')
    expect(page).to have_link('Voltar')
  end

  scenario 'and validates empty fields' do
    create(:manufacturer, name: 'Fiat')
    user = create(:user)
    login_as(user, scope: :user)
    visit root_path

    click_on 'Fabricantes'
    click_on 'Fiat'
    click_on 'Editar'
    fill_in 'Nome:', with: ''
    click_on 'Salvar'

    expect(page).to have_content('Você deve corrigir os erros para continuar')
    expect(page).to have_content('Nome não pode ficar em branco')
  end
end
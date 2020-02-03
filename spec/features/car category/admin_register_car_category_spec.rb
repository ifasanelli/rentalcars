require 'rails_helper'

feature 'Admin create car category' do
  scenario 'successfully' do
    User.create!(email: 'italo@italo.com', password:123_456)
    visit root_path
    click_on 'Entrar'
    within 'form' do
      fill_in 'Email', with: 'italo@italo.com'
      fill_in 'Senha', with: '123456'
      click_on 'Entrar'
    end

    click_on 'Categorias'
    click_on 'Nova categoria'
    fill_in 'Nome', with: 'A'
    fill_in 'Diária', with: '100.95'
    fill_in 'Seguro', with: '50.95'
    fill_in 'Seguro para terceiros', with: '150.45'
    click_on 'Salvar'

    expect(page).to have_content('A')
    expect(page).to have_content('100.95')
    expect(page).to have_content('50.95')
    expect(page).to have_content('150.45')
    expect(page).to have_link('Voltar')
  end

  scenario 'and validates empty fields' do
    User.create!(email: 'italo@italo.com', password:123_456)
    visit root_path
    click_on 'Entrar'
    within 'form' do
      fill_in 'Email', with: 'italo@italo.com'
      fill_in 'Senha', with: '123456'
      click_on 'Entrar'
    end

    click_on 'Categorias'
    click_on 'Nova categoria'
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
  scenario 'and validates duplicated names' do
    CarCategory.create!(name: 'A',
    daily_rate: 100.95,
    car_insurance: 50.95,
    third_party_insurance: 150.45)
    User.create!(email: 'italo@italo.com', password:123_456)
    visit root_path
    click_on 'Entrar'
    within 'form' do
      fill_in 'Email', with: 'italo@italo.com'
      fill_in 'Senha', with: '123456'
      click_on 'Entrar'
    end

    click_on 'Categorias'
    click_on 'Nova categoria'
    fill_in 'Nome', with: 'A'
    fill_in 'Diária', with: '150.95'
    fill_in 'Seguro', with: '60.95'
    fill_in 'Seguro para terceiros', with: '170.45'
    click_on 'Salvar'

    expect(page).to have_content('Você deve corrigir os erros para continuar')
    expect(page).to have_content('Categoria já existente')
  end
end

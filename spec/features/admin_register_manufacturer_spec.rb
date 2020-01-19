require 'rails_helper'

feature 'Admin register manufacturer' do
    scenario 'successfully' do
        user = User.create!(email: 'italo@italo.com', password:123456)
        visit root_path
        click_on 'Entrar'
        within 'form' do
            fill_in 'Email', with: 'italo@italo.com'
            fill_in 'Senha', with: '123456'
            click_on 'Entrar'
        end

        click_on 'Fabricantes'
        click_on 'Novo fabricante'
        fill_in 'Nome:', with: 'Ferrari'
        click_on 'Salvar'

        expect(page).to have_content('Ferrari')
        expect(page).to have_content('Voltar')
    end

    scenario 'and validates empty fields' do
        Manufacturer.create!(name: 'Fiat')
        user = User.create!(email: 'italo@italo.com', password:123456)
        visit root_path
        click_on 'Entrar'
        within 'form' do
            fill_in 'Email', with: 'italo@italo.com'
            fill_in 'Senha', with: '123456'
            click_on 'Entrar'
        end

        click_on 'Fabricantes'
        click_on 'Novo fabricante'
        fill_in 'Nome:', with: ''
        click_on 'Salvar'

        expect(page).to have_content('Você deve corrigir os erros para continuar')
        expect(page).to have_content('Nome não pode ficar em branco')
    end
    scenario 'and validates duplicated names' do
        Manufacturer.create!(name: 'Fiat')
        user = User.create!(email: 'italo@italo.com', password:123456)
        visit root_path
        click_on 'Entrar'
        within 'form' do
            fill_in 'Email', with: 'italo@italo.com'
            fill_in 'Senha', with: '123456'
            click_on 'Entrar'
        end

        click_on 'Fabricantes'
        click_on 'Novo fabricante'
        fill_in 'Nome:', with: 'Fiat'
        click_on 'Salvar'
    
        expect(page).to have_content('Você deve corrigir os erros para continuar:')
        expect(page).to have_content('Fabricante já existente')
      end
end
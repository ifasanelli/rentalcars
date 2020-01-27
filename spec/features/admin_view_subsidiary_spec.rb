require 'rails_helper'

feature 'Admin view subsidiary' do
    scenario 'seccessfully' do
        Subsidiary.create!(name: 'Santos', 
                           cnpj: '70047047000196', 
                           address: 'Rua dos Santos, 13')
        Subsidiary.create!(name: 'Osasco', 
                            cnpj: '67285256000163', 
                            address: 'Rua de Osasco, 14')
        Subsidiary.create!(name: 'Guarulhos', 
                           cnpj: '19139393000147', 
                           address: 'Rua de Guarulhos, 19')
        user = User.create!(email: 'italo@italo.com', password:123456)
        visit root_path
        click_on 'Entrar'
        within 'form' do
            fill_in 'Email', with: 'italo@italo.com'
            fill_in 'Senha', with: '123456'
            click_on 'Entrar'
        end

        click_on 'Filiais'

        expect(page).to have_content('Santos')
        expect(page).to have_content('70047047000196')
        expect(page).to have_content('Rua dos Santos, 13')
        expect(page).to have_content('Osasco')
        expect(page).to have_content('67285256000163')
        expect(page).to have_content('Rua de Osasco, 14')
        expect(page).to have_content('Guarulhos')
        expect(page).to have_content('19139393000147')
        expect(page).to have_content('Rua de Guarulhos, 19')
        expect(page).to have_content('Voltar')
    end

    scenario 'and view subsidiary details' do
        Subsidiary.create!(name: 'Santos', 
                           cnpj: '70047047000196', 
                           address: 'Rua dos Santos, 13')
        Subsidiary.create!(name: 'Osasco', 
                           cnpj: '67285256000163', 
                           address: 'Rua de Osasco, 14')
        user = User.create!(email: 'italo@italo.com', password:123456)
        visit root_path
        click_on 'Entrar'
        within 'form' do
            fill_in 'Email', with: 'italo@italo.com'
            fill_in 'Senha', with: '123456'
            click_on 'Entrar'
        end

        click_on 'Filiais'
        click_on 'Santos'

        expect(page).to have_content('Santos')
        expect(page).to have_content('70047047000196')
        expect(page).to have_content('Rua dos Santos, 13')
        expect(page).to_not have_content('Osasco')
        expect(page).to_not have_content('67285256000163')
        expect(page).to_not have_content('Rua de Osasco, 14')
        expect(page).to have_content('Voltar')
    end
end
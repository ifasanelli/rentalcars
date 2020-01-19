require 'rails_helper'

feature 'Admin view subsidiary' do
    scenario 'seccessfully' do
        Subsidiary.create!(name: 'Baixada Santista', 
                           cnpj: '13.131.313/0001-13', 
                           address: 'Rua dos Santos, 13')
        user = User.create!(email: 'italo@italo.com', password:123456)
        visit root_path
        click_on 'Entrar'
        within 'form' do
            fill_in 'Email', with: 'italo@italo.com'
            fill_in 'Senha', with: '123456'
            click_on 'Entrar'
        end

        click_on 'Filiais'
        click_on 'Baixada Santista'
        click_on 'Editar'
        fill_in 'Nome', with: 'Santos'
        click_on 'Salvar'

        expect(page).to have_content('Santos')
        expect(page).to have_content('13.131.313/0001-13')
        expect(page).to have_content('Rua dos Santos, 13')
        expect(page).to have_content('Voltar')
    end
end
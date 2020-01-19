require 'rails_helper'

feature 'Admin register subsidiary' do
    scenario 'seccessfully' do
        user = User.create!(email: 'italo@italo.com', password:123456)
        visit root_path
        click_on 'Entrar'
        within 'form' do
            fill_in 'Email', with: 'italo@italo.com'
            fill_in 'Senha', with: '123456'
            click_on 'Entrar'
        end

        click_on 'Filiais'
        click_on 'Nova filial'
        fill_in 'Nome', with: 'Ipiranga'
        fill_in 'CNPJ', with: '11.111.111/0001-11'
        fill_in 'Endereço', with: 'Rua do Ipioranga, 11'
        click_on 'Salvar'

        expect(page).to have_content('Ipiranga')
        expect(page).to have_content('11.111.111/0001-11')
        expect(page).to have_content('Rua do Ipioranga, 11')
        expect(page).to have_content('Voltar')
    end
end
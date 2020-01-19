require 'rails_helper'

feature 'Admin view car category' do
    scenario 'successfully' do
        CarCategory.create!(name: 'A',
                            daily_rate: 100.95,
                            car_insurance: 3000.95,
                            third_party_insurance: 1500.45)
        CarCategory.create!(name: 'AA',
                            daily_rate: 200.95,
                            car_insurance: 6000.95,
                            third_party_insurance: 3000.45)
        CarCategory.create!(name: 'AAA',
                            daily_rate: 300.95,
                            car_insurance: 9000.95,
                            third_party_insurance: 4500.45)
        user = User.create!(email: 'italo@italo.com', password:123456)
        visit root_path
        click_on 'Entrar'
        within 'form' do
            fill_in 'Email', with: 'italo@italo.com'
            fill_in 'Senha', with: '123456'
            click_on 'Entrar'
        end

        click_on 'Categorias'

        expect(page).to have_content('A')
        expect(page).to have_content('100.95')
        expect(page).to have_content('3000.95')
        expect(page).to have_content('1500.45')
        expect(page).to have_content('AA')
        expect(page).to have_content('200.95')
        expect(page).to have_content('6000.95')
        expect(page).to have_content('3000.45')
        expect(page).to have_content('AAA')
        expect(page).to have_content('300.95')
        expect(page).to have_content('9000.95')
        expect(page).to have_content('4500.45')
        expect(page).to have_link('Voltar')
    end
    
    scenario 'and see manufacturer details' do
        CarCategory.create!(name: 'A',
                            daily_rate: 100.95,
                            car_insurance: 3000.95,
                            third_party_insurance: 1500.45)
        user = User.create!(email: 'italo@italo.com', password:123456)
        visit root_path
        click_on 'Entrar'
        within 'form' do
            fill_in 'Email', with: 'italo@italo.com'
            fill_in 'Senha', with: '123456'
            click_on 'Entrar'
        end

        click_on 'Categorias'
        click_on 'A'

        expect(page).to have_content('A')
        expect(page).to have_content('100.95')
        expect(page).to have_content('3000.95')
        expect(page).to have_content('1500.45')
        expect(page).to have_link('Voltar')
    end
end
require 'rails_helper'

feature 'Admin schedule rental' do
    scenario 'successfully' do
        user = User.create!(email: 'italo@italo.com', password:123456)
        client = Client.create!(name: 'Mariana', cpf: '123.456.789-10', email: 'mari@gmail.com')
        car_category = CarCategory.create!(name: 'A', daily_rate: 95.98, car_insurance: 30.45, third_party_insurance: 22.99)


        login_as(user, scope: :user) 
        visit root_path
        click_on 'Locações'
        click_on 'Agendar locação'
        fill_in 'Data inicial', with: '20/04/2040'
        fill_in 'Data final', with: '20/05/2040'
        select "Mariana - 123.456.789-10", from: 'Cliente'
        select 'A', from: 'Categoria'
        click_on 'Agendar'
    
        expect(Rental.last.code).to match(/[a-zA-Z0-9]+/)
        expect(page).to have_content('20/04/2040')
        expect(page).to have_content('20/05/2040')
        expect(page).to have_content('A')
        expect(page).to have_content('Mariana')
        expect(page).to have_content('123.456.789-10')
        expect(page).to have_content('mari@gmail.com')
    end
end
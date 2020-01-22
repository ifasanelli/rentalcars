require 'rails_helper'

feature 'Admin search rental' do
  scenario 'by partial query' do
    user = User.create!(email: 'italo@email.com', password: '123456')
    client = Client.create!(name: 'Mariana', 
                            cpf: '369.718.887-34', 
                            email: 'mari@email.com')
    car_category = CarCategory.create!(name: 'A', 
                                       daily_rate: 165.6, 
                                       car_insurance: 80.59, 
                                       third_party_insurance: 55.95)
    Rental.create!(code: 'CA000', 
                   start_date: 1.day.from_now, 
                   end_date: 5.day.from_now, 
                   client: client, 
                   car_category: car_category)
    Rental.create!(code: 'CA001', 
                   start_date: 1.week.from_now, 
                   end_date: 2.week.from_now, 
                   client: client, 
                   car_category: car_category)
    Rental.create!(code: 'CA002', 
                   start_date: 20.day.from_now, 
                   end_date: 25.day.from_now, 
                   client: client, 
                   car_category: car_category)

    login_as(user, scope: :user)
    visit root_path
    click_on 'Locações'
    fill_in 'Buscar locação por código', with: 'CA000'
    click_on 'Buscar'

    expect(page).to have_content('CA000')
    expect(page).to have_content('Mariana')
    
    expect(page).to_not have_content('CA001')
    expect(page).to_not have_content('CA002')

  end
end

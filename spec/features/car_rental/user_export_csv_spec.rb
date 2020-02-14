require 'rails_helper'

feature 'User exports csv' do
  scenario 'successfully' do
    user = create(:user)
    login_as(user, scope: :user)
    visit root_path

    click_on 'Locações'
    click_on 'Relatórios'

    expect(page).to have_content(user.email)
  end
end
require 'rails_helper'

describe 'CarCategory Menagement' do
  context 'show' do
    it 'renders a json successfully' do
      car_category = CarCategory.create!(name: 'A', daily_rate: 100.95, car_insurance: 50.95, third_party_insurance: 150.45)

      get api_v1_car_category_path(car_category)
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(200)
      expect(json[:name]).to include car_category.name
      expect(json[:daily_rate]).to eq("100.95")
      expect(json[:car_insurance]).to eq("50.95")
      expect(json[:third_party_insurance]).to eq("150.45")
    end
  end
  context 'index' do
    it 'renders a json successfully' do
      car_category = CarCategory.create!(name: 'A', daily_rate: 100.95, car_insurance: 50.95, third_party_insurance: 150.45)
      other_car_category = CarCategory.create!(name: 'AA', daily_rate: 150.95, car_insurance: 100.95, third_party_insurance: 200.45)
      another_car_category = CarCategory.create!(name: 'AAA', daily_rate: 200.95, car_insurance: 250.95, third_party_insurance: 350.45)


      get api_v1_car_categories_path
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(200)
      expect(json.length). to eq 3

      expect(json[0][:name]).to include car_category.name
      expect(json[0][:daily_rate]).to eq("100.95")
      expect(json[0][:car_insurance]).to eq("50.95")
      expect(json[0][:third_party_insurance]).to eq("150.45")

      expect(json[1][:name]).to include other_car_category.name
      expect(json[1][:daily_rate]).to eq("150.95")
      expect(json[1][:car_insurance]).to eq("100.95")
      expect(json[1][:third_party_insurance]).to eq("200.45")

      expect(json[2][:name]).to include another_car_category.name
      expect(json[2][:daily_rate]).to eq("200.95")
      expect(json[2][:car_insurance]).to eq("250.95")
      expect(json[2][:third_party_insurance]).to eq("350.45")
    end
  end
end

require 'rails_helper'

describe 'Car model Menagement' do
  context 'show' do
    it 'renders a json successfully' do
      manufacturer = Manufacturer.create!(name: 'BMW')
      car_category = CarCategory.create!(name: 'A', daily_rate: 30, car_insurance: 30, third_party_insurance: 30)
      car_model = CarModel.create!(name: 'X5', year: '2019', motorization: '1.6', fuel_type: 'Flex', manufacturer: manufacturer, car_category: car_category)

      get api_v1_car_model_path(car_model)
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(200)
      expect(json[:name]).to eq(car_model.name)
      expect(json[:year]).to eq(car_model.year)
      expect(json[:motorization]).to eq(car_model.motorization)
      expect(json[:fuel_type]).to eq(car_model.fuel_type)
    end
  end
  context 'index' do
    it 'renders a json succssfully' do
      manufacturer = Manufacturer.create!(name: 'BMW')
      car_category = CarCategory.create!(name: 'A', daily_rate: 30, car_insurance: 30, third_party_insurance: 30)
      car_model = CarModel.create!(name: 'X5', year: '2019', motorization: '1.6', fuel_type: 'Flex', manufacturer: manufacturer, car_category: car_category)
      other_car_model = CarModel.create!(name: 'X6', year: '2020', motorization: '2.6', fuel_type: 'Flex', manufacturer: manufacturer, car_category: car_category)


      get api_v1_car_models_path
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(200)
      expect(json.length). to eq 2

      expect(json[0][:name]).to include car_model.name
      expect(json[0][:year]).to include car_model.year
      expect(json[0][:motorization]).to include car_model.motorization
      expect(json[0][:fuel_type]).to include car_model.fuel_type

      expect(json[1][:name]).to include other_car_model.name
      expect(json[1][:year]).to include other_car_model.year
      expect(json[1][:motorization]).to include other_car_model.motorization
      expect(json[1][:fuel_type]).to include other_car_model.fuel_type
    end
  end

end

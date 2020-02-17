require 'rails_helper'

describe 'Car Menagement' do
  context 'show' do
    it 'renders a json successfully' do
      Manufacturer.create!(name: 'BMW')
      subsidiary = Subsidiary.create!(name: 'Filial Ipiranga', cnpj: '70976813000105', address: 'Alameda Santos, 1293')
      CarCategory.create!(name: 'A', daily_rate: 30, car_insurance: 30, third_party_insurance: 30)
      car_model = CarModel.create!(name: 'X5', year: '2019', motorization: '1.6', fuel_type: 'Flex', manufacturer_id: 1, car_category_id: 1)
      car = Car.create!(license_plate: 'ABC-1212', color: 'Branco', car_model: car_model, mileage: 155, subsidiary: subsidiary, status: 0)

      get api_v1_car_path(car)
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(200)
      expect(json[:license_plate]).to eq(car.license_plate)
      expect(json[:color]).to eq(car.color)
      expect(json[:mileage]).to eq(car.mileage)
      expect(json[:status]).to eq(car.status)
    end
  end
  context 'index' do
    it 'renders a json succssfully' do
      manufacturer = Manufacturer.create!(name: 'BMW')
      subsidiary = Subsidiary.create!(name: 'Filial Ipiranga', cnpj: '70976813000105', address: 'Alameda Santos, 1293')
      car_category = CarCategory.create!(name: 'A', daily_rate: 30, car_insurance: 30, third_party_insurance: 30)
      car_model = CarModel.create!(name: 'X5', year: '2019', motorization: '1.6', fuel_type: 'Flex', manufacturer: manufacturer, car_category: car_category)
      other_car_model = CarModel.create!(name: 'X3', year: '2017', motorization: '2.6', fuel_type: 'Gasolina', manufacturer: manufacturer, car_category: car_category)
      car = Car.create!(license_plate: 'ABC-1313', color: 'Prata', car_model: car_model, mileage: 65, subsidiary: subsidiary, status: 0)
      other_car = Car.create!(license_plate: 'ABC-1212', color: 'Branco', car_model: other_car_model, mileage: 180, subsidiary: subsidiary, status: 0)
      another_car = Car.create!(license_plate: 'ABC-1212', color: 'Branco', car_model: car_model, mileage: 155, subsidiary: subsidiary, status: 0)


      get api_v1_cars_path
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(200)
      expect(json.length). to eq 3

      expect(json[0][:license_plate]).to include car.license_plate
      expect(json[0][:color]).to include car.color
      expect(json[0][:mileage]).to eq(car.mileage)
      expect(json[0][:status]).to include car.status

      expect(json[1][:license_plate]).to include other_car.license_plate
      expect(json[1][:color]).to include other_car.color
      expect(json[1][:mileage]).to eq(other_car.mileage)
      expect(json[1][:status]).to include other_car.status

      expect(json[2][:license_plate]).to include another_car.license_plate
      expect(json[2][:color]).to include another_car.color
      expect(json[2][:mileage]).to eq(another_car.mileage)
      expect(json[2][:status]).to include another_car.status
    end
  end

  # context 'create' do
  #   it 'should create a car' do
  #     manufacturer = Manufacturer.create!(name: 'BMW')
  #     subsidiary = Subsidiary.create!(name: 'Filial Ipiranga', cnpj: '70976813000105', address: 'Alameda Santos, 1293')
  #     car_category = CarCategory.create!(name: 'A', daily_rate: 30, car_insurance: 30, third_party_insurance: 30)
  #     car_model = CarModel.create!(name: 'X5', year: '2019', motorization: '1.6', fuel_type: 'Flex', manufacturer_id: manufacturer.id, car_category_id: car_category.id)
  #     car = Car.create!(license_plate: 'ABC-1212', color: 'Branco', car_model: car_model, mileage: 155, subsidiary: subsidiary, status: :available)

  #     post  api_v1_cars_path, params: {license_plate: car.license_plate, color: car.color, car_model_id: car_model.id, mileage: car.mileage, subsidiary_id: subsidiary.id, status: car.status}

  #     json = JSON.parse(response.body, symbolize_names: true)


  #     expect(response).to have_http_status(201)
  #     expect(json[:license_plate]).to include car.license_plate
  #     expect(json[:color]).to include car.color
  #     expect(json[:mileage]).to eq(car.mileage)
  #     expect(json[:status]).to include car.status
  #   end
  # end

  context 'status' do
    it 'should return and render a car modified by status' do
      manufacturer = Manufacturer.create!(name: 'BMW')
      subsidiary = Subsidiary.create!(name: 'Filial Ipiranga', cnpj: '70976813000105', address: 'Alameda Santos, 1293')
      car_category = CarCategory.create!(name: 'A', daily_rate: 30, car_insurance: 30, third_party_insurance: 30)
      car_model = CarModel.create!(name: 'X5', year: '2019', motorization: '1.6', fuel_type: 'Flex', manufacturer_id: manufacturer.id, car_category_id: car_category.id)
      car = Car.create!(license_plate: 'ABC-1212', color: 'Branco', car_model: car_model, mileage: 155, subsidiary: subsidiary, status: :available)

      patch status_api_v1_car_path(car), params: { status: 'unavailable' }

      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(200)
      expect(json[:status]).to eq('unavailable')
    end
  end
end

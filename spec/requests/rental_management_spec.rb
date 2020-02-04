require 'rails_helper'

describe 'Rental Management' do
  context 'create' do
    it 'must create a rental successfully' do
      user = create(:user)
      manufacturer = create(:manufacturer)
      client = create(:client, name: 'Mariana', cpf: '12345678910',
                               email: 'mariana@gmail.com')
      car_category = create(:car_category, name: 'A', daily_rate: 100.99, car_insurance: 49.45,
                                           third_party_insurance: 35.99)
      car_model = create(:car_model, name: 'Punto', year: '2019', manufacturer: manufacturer,
                                     motorization: '1.6', car_category: car_category,
                                     fuel_type: 'Gasolina')
      subsidiary = create(:subsidiary, name: 'Filial Santos', cnpj: '12923833000103', address: 'Rua de Santos, 13')
      create(:car, license_plate: 'ABC-1234', color: 'Prata', car_model: car_model,
                   mileage: 2000, status: 0, subsidiary: subsidiary)

      post api_v1_rentals_path, params: {start_date: Date.current, end_date: 1.day.from_now,
                                         client_id: client.id, car_category_id: car_category.id,
                                         user_id: user.id}

      expect(response).to have_http_status(:ok)
    end
  end

  context 'delete' do
    it 'successfully' do
      user = create(:user)
      manufacturer = create(:manufacturer)
      client = create(:client, name: 'Mariana', cpf: '12345678910',
                               email: 'mariana@gmail.com')
      car_category = create(:car_category, name: 'A', daily_rate: 100.99, car_insurance: 49.45,
                                           third_party_insurance: 35.99)
      car_model = create(:car_model, name: 'Punto', year: '2019', manufacturer: manufacturer,
                                     motorization: '1.6', car_category: car_category,
                                     fuel_type: 'Gasolina')
      subsidiary = create(:subsidiary, name: 'Filial Santos', cnpj: '12923833000103', address: 'Rua de Santos, 13')
      create(:car, license_plate: 'ABC-1234', color: 'Prata', car_model: car_model,
                   mileage: 2000, status: 0, subsidiary: subsidiary)
      rental = create(:rental, code: 'CX0000', start_date: Date.current, end_date: 1.day.from_now,
                               client_id: client.id, car_category_id: car_category.id,
                               user_id: user.id)

      delete api_v1_rental_path(rental)

      expect(response).to have_http_status :ok
    end
  end
end

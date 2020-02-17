require 'rails_helper'

describe 'Manufacturer Menagement' do
  context 'show' do
    it 'renders a json successfully' do
      manufacturer = Manufacturer.create!(name: 'BMW')

      get api_v1_manufacturer_path(manufacturer)
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(200)
      expect(json[:name]).to eq(manufacturer.name)
    end
  end
  context 'index' do
    it 'renders a json successfully' do
      manufacturer = Manufacturer.create!(name: 'BMW')
      other_manufacturer = Manufacturer.create!(name: 'Ford')
      another_manufacturer = Manufacturer.create!(name: 'Volvo')


      get api_v1_manufacturers_path
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(200)
      expect(json.length). to eq 3

      expect(json[0][:name]).to include manufacturer.name

      expect(json[1][:name]).to include other_manufacturer.name

      expect(json[2][:name]).to include another_manufacturer.name
    end
  end
end

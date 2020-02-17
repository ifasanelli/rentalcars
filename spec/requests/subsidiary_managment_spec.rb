require 'rails_helper'

describe 'Subsidiary Menagement' do
  context 'show' do
    it 'renders a json successfully' do
      subsidiary = Subsidiary.create!(name: 'Filial Santos', cnpj: '14465957000118', address: 'Rua de Santos, 13')

      get api_v1_subsidiary_path(subsidiary)
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(200)
      expect(json[:name]).to eq(subsidiary.name)
      expect(json[:cnpj]).to eq(subsidiary.cnpj)
      expect(json[:address]).to eq(subsidiary.address)
    end
  end
  context 'index' do
    it 'renders a json successfully' do
      subsidiary = Subsidiary.create!(name: 'Filial Santos', cnpj: '14465957000118', address: 'Rua de Santos, 13')
      other_subsidiary = Subsidiary.create!(name: 'Filial Maresias', cnpj: '02197188000135', address: 'Rua de Santos, 12')
      another_subsidiary = Subsidiary.create!(name: 'Filial Ipiranga', cnpj: '89904602000187', address: 'Rua do Ipiranga, 11')


      get api_v1_subsidiaries_path
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(200)
      expect(json.length). to eq 3

      expect(json[0][:name]).to include subsidiary.name
      expect(json[0][:cnpj]).to include subsidiary.cnpj
      expect(json[0][:address]).to include subsidiary.address

      expect(json[1][:name]).to include other_subsidiary.name
      expect(json[1][:cnpj]).to include other_subsidiary.cnpj
      expect(json[1][:address]).to include other_subsidiary.address

      expect(json[2][:name]).to include another_subsidiary.name
      expect(json[2][:cnpj]).to include another_subsidiary.cnpj
      expect(json[2][:address]).to include another_subsidiary.address
    end
  end
end

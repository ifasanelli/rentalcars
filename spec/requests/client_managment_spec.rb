require 'rails_helper'

describe 'Client Menagement' do
  context 'show' do
    it 'renders a json successfully' do
      client = Client.create!(name: 'Mariana', email: 'mari@email.com', cpf: '123.456.789-10')

      get api_v1_client_path(client)
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(200)
      expect(json[:name]).to eq(client.name)
      expect(json[:email]).to eq(client.email)
      expect(json[:cpf]).to eq(client.cpf)
    end
  end
  context 'index' do
    it 'renders a json successfully' do
      client = Client.create!(name: 'Mariana', email: 'mari@email.com', cpf: '123.456.789-10')
      other_client = Client.create!(name: 'Amélia', email: 'meia@email.com', cpf: '987.654.312-01')



      get api_v1_clients_path
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(200)
      expect(json.length). to eq 2

      expect(json[0][:name]).to include client.name
      expect(json[0][:email]).to include client.email
      expect(json[0][:cpf]).to include client.cpf

      expect(json[1][:name]).to include other_client.name
      expect(json[1][:email]).to include other_client.email
      expect(json[1][:cpf]).to include other_client.cpf
    end
  end

  context 'create' do
    it 'should create a client' do
      params = { name: "Mariana", email: "mari@email.com", cpf: "123.456.789-10" }.to_hash

      post  api_v1_clients_path, params: params

      json = JSON.parse(response.body, symbolize_names: true)


      expect(response).to have_http_status(201)
      expect(json[:name]).to include 'Mariana'
      expect(json[:email]).to include 'mari@email.com'
      expect(json[:cpf]).to include '123.456.789-10'
    end
  end

end

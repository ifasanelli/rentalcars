class Api::V1::ClientsController < Api::V1::ApiController
		def index
			@clients = Client.all
			render json: @clients
		end

	def show
		@client = Client.find(params[:id])
		render json: @client
	end

	def create
		@client = Client.create(client_params)
		return render json: @client, status: :created if @client.save
	end


	private
	def client_params
		params.permit(:name, :email, :cpf)
	end
end

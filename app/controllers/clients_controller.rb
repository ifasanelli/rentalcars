class ClientsController < ApplicationController
    def index
        @clients = Client.all  
    end

    def show
        @client = Client.find(params[:id])
    end

    def new
        @client = Client.new
    end

    def edit
        @client = Client.find(params[:id])
    end

    def create
        @client = Client.new(client_params)
        @client.save
        redirect_to @client
    end

    def update
        @client = Client.find(params[:id])
        @client.update(client_params)
        redirect_to @client
    end

    private

    def client_params
        params.require(:client).permit(:name, :email, :cpf)
    end
end
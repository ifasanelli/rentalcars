class ClientsController < ApplicationController
    before_action :authenticate_user!
    before_action :load_client, only: [:show, :edit, :update, :destroy]

    def index
        @clients = Client.all  
    end

    def show
    end

    def new
        @client = Client.new
    end

    def edit
    end

    def create
        @client = Client.new(client_params)
        if @client.save
            redirect_to @client
        else  
            render :new
        end
    end

    def update
        if @client.update(client_params)
            redirect_to @client
        else 
            render :edit
        end
    end

    def destroy
        @client.destroy
        redirect_to clients_path
    end

    private

    def client_params
        params.require(:client).permit(:name, :email, :cpf)
    end

    def load_client
        @client = Client.find(params[:id])
    end
end
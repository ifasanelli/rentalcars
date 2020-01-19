class SubsidiariesController < ApplicationController
    def index
        @subsidiaries = Subsidiary.all 
    end

    def show
        @subsidiary = Subsidiary.find(params[:id])
    end

    def new
        @subsidiary = Subsidiary.new
    end

<<<<<<< HEAD
    def edit
        @subsidiary = Subsidiary.find(params[:id])
    end

=======
>>>>>>> eb14f84cee60ed83edce76d6dbd424c9ae92227d
    def create
        @subsidiary = Subsidiary.new(subsidiary_params)
        @subsidiary.save
        redirect_to @subsidiary
    end

<<<<<<< HEAD
    def update
        @subsidiary = Subsidiary.find(params[:id])
        @subsidiary.update(subsidiary_params)
        redirect_to @subsidiary
    end

=======
>>>>>>> eb14f84cee60ed83edce76d6dbd424c9ae92227d
    private

    def subsidiary_params
        params.require(:subsidiary).permit(:name, :cnpj, :address)
    end
end
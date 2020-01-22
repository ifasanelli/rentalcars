class RentalsController < ApplicationController
    before_action :authenticate_user!

    def index
        @rentals = Rental.all
    end

    def results
        @q = params[:q]
        @rentals = Rental.where('UPPER(code) LIKE ?', "%#{params[:q]}%")
    end

    def show
        @rental = Rental.find(params[:id])
    end

    def new
        @rental = Rental.new
        @clients = Client.all
        @car_categories = CarCategory.all
    end
    
    def create
        @rental = Rental.new(rental_params)
        @rental.code = SecureRandom.hex(6)
        @rental.save
        redirect_to @rental
    end

    private
    
    def rental_params
        params.require(:rental).permit(:start_date, :end_date,:client_id, :car_category_id)
    end
    
        
end
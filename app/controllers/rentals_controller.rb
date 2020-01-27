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
        @rental.user = current_user
        @rental.save
        redirect_to @rental
    end

    def destroy
        @rental = Rental.find(params[:id])
        @rental.destroy
        redirect_to rentals_path
    end

    def start
        @rental = Rental.find(params[:id])
        @cars = Car.where(car_model: @rental.car_category.car_models)
                   .where(status: :available)
    end

    def confirm_start
        @rental = Rental.find(params[:id])
        @rental.confirmed!
        @car = Car.find(params[:car_id])
        @car.unavailable!
        @car_rental = CarRental.create(rental: @rental, 
                                       car: @car, 
                                       price: @rental.car_category.daily_price,
                                       start_mileage: @car.mileage)
        redirect_to @car_rental
    
    end

    private
    
    def rental_params
        params.require(:rental).permit(:start_date, :end_date,:client_id, :car_category_id)
    end
    
        
end
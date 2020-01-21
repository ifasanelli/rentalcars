class RentalsController < ApplicationController
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
end
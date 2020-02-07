class CarRentalsController < ApplicationController
	def index
		@car_rentals = CarRental.all
	end

	def show
		@car_rental = CarRental.find(params[:id])
	end

	def reports
		@h1 = 'HII'
	end
end

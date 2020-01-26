class CarsController < ApplicationController
    def index
        @cars = Car.all
    end

    def show
        @car = Car.find(params[:id])
    end

    def new
        @car = Car.new
        @car_models = CarModel.all
        @subsidiaries = Subsidiary.all
    end

    def create
        @car_models = CarModel.all
        @subsidiaries = Subsidiary.all
        @car = Car.new(car_params)
        @car.status = 0
        @car.save
        redirect_to @car
    end

    private

    def car_params
        params.require(:car).permit(:license_plate, :color, :car_model_id, :mileage, :status, :subsidiary_id)
    end
end
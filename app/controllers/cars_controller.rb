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

    def edit
        @car = Car.find(params[:id])
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

    def update
        @car_models = CarModel.all
        @subsidiaries = Subsidiary.all
        @car = Car.find(params[:id])
        @car.status = 0
        @car.update(car_params)
        redirect_to @car
    end

    def destroy
        @car = Car.find(params[:id])
        @car.destroy
        redirect_to cars_path
    end

    private

    def car_params
        params.require(:car).permit(:license_plate, :color, :car_model_id, :mileage, :status, :subsidiary_id)
    end
end
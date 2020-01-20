class CarModelsController < ApplicationController
    def index
        @car_models = CarModel.all 
    end

    def show
        @car_model = CarModel.find(params[:id])
    end

    def new
        @car_categories = CarCategory.all 
        @manufacturers = Manufacturer.all
        @car_model = CarModel.new
    end

    def edit
        @car_categories = CarCategory.all 
        @manufacturers = Manufacturer.all
        @car_model = CarModel.find(params[:id])
    end 

    def create
        @car_categories = CarCategory.all 
        @manufacturers = Manufacturer.all
        @car_model = CarModel.new(car_model_params)
        @car_model.save
        redirect_to @car_model
    end

    def update
        @car_categories = CarCategory.all 
        @manufacturers = Manufacturer.all
        @car_model = CarModel.find(params[:id])
        @car_model.update(car_model_params)
        redirect_to @car_model
    end

    private

    def car_model_params
        params.require(:car_model).permit(:name, :motorization, :year, :fuel_type, :car_category_id, :manufacturer_id)
    end
end
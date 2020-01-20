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
        if @car_model.save
            redirect_to @car_model
        else  
            render :new
        end
    end

    def update
        @car_categories = CarCategory.all 
        @manufacturers = Manufacturer.all
        @car_model = CarModel.find(params[:id])
        if @car_model.update(car_model_params)
            redirect_to @car_model
        else  
            render :edit
        end
    end

    def destroy
        @car_model = CarModel.find(params[:id])
        @car_model.destroy
        redirect_to car_models_path
    end

    private

    def car_model_params
        params.require(:car_model).permit(:name, :motorization, :year, :fuel_type, :car_category_id, :manufacturer_id)
    end
end
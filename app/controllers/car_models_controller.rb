class CarModelsController < ApplicationController
    before_action :authenticate_user!
    before_action :load_car_model, only: [:show, :edit, :update, :destroy]
    before_action :load_car_category, only: [:new, :edit, :create, :update]
    before_action :load_manufacturer, only: [:new, :edit, :create, :update]

    def index
        @car_models = CarModel.all 
    end

    def show
    end

    def new
        @car_model = CarModel.new
    end

    def edit
    end 

    def create
        @car_model = CarModel.new(car_model_params)
        if @car_model.save
            redirect_to @car_model
        else  
            render :new
        end
    end

    def update
        if @car_model.update(car_model_params)
            redirect_to @car_model
        else  
            render :edit
        end
    end

    def destroy
        @car_model.destroy
        redirect_to car_models_path
    end

    private

    def car_model_params
        params.require(:car_model).permit(:name, :motorization, :year, :fuel_type, :car_category_id, :manufacturer_id)
    end

    def load_car_model
        @car_model = CarModel.find(params[:id])
    end

    def load_car_category
        @car_categories = CarCategory.all 
    end

    def load_manufacturer
        @manufacturers = Manufacturer.all
    end

end
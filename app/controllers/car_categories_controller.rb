class CarCategoriesController < ApplicationController
    before_action :authenticate_user!
    before_action :load_car_category, only: [:show, :edit, :update, :destroy]

    def index
        @car_categories = CarCategory.all 
    end

    def show
    end

    def new
        @car_category = CarCategory.new
    end

    def edit
    end

    def create
        @car_category = CarCategory.new(car_category_params)
        if @car_category.save
            redirect_to @car_category
        else   
            render :new
        end
    end

    def update
        if @car_category.update(car_category_params)
            redirect_to @car_category
        else  
            render :edit
        end
    end

    def destroy
        @car_category.destroy
        redirect_to car_categories_path
    end

    private

    def car_category_params
        params.require(:car_category).permit(:name, :daily_rate, :car_insurance, :third_party_insurance)
    end

    def load_car_category
        @car_category = CarCategory.find(params[:id])
    end
end
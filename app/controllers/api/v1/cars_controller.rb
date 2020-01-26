class Api::V1::CarsController < Api::V1::ApiController
    def index
        @cars = Car.all
        render json: @cars
    end
  
    def show
        @car = Car.find(params[:id])
        render json: @car
    end
  
    def create
        @car = Car.create(car_params)
        if @car.save
          render json: @car, status: :created
        end
    end
    
  
  
    private
  
    def car_params
        params.permit(:license_plate, :color, :car_model_id, :mileage, :subsidiary_id, :status)
    end
end
  
class Api::V1::CarModelsController < Api::V1::ApiController

  def index
    @car_models = CarModel.all
    render json: @car_models
  end

  def show
    @car_model = CarModel.find(params[:id])
    render json: @car_model, status: :ok
  end

end
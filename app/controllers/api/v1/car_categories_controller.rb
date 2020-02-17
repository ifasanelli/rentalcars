class Api::V1::CarCategoriesController < Api::V1::ApiController

  def index
    @car_categories = CarCategory.all
    render json: @car_categories
  end

  def show
    @car_category = CarCategory.find(params[:id])
    render json: @car_category, status: :ok
  end

end
class Api::V1::ManufacturersController < Api::V1::ApiController

  def index
    @manufacturers = Manufacturer.all
    render json: @manufacturers
  end

  def show
    @manufacturer = Manufacturer.find(params[:id])
    render json: @manufacturer, status: :ok
  end

end

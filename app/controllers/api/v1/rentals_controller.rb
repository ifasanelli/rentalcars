class Api::V1::RentalsController < Api::V1::ApiController
  def create
    @rental = Rental.create!(rental_params)
    render json: @rental, status: :ok
  end

  def destroy
    @rental = Rental.find(params[:id])
    render json: '', status: :ok if @rental.destroy
  end


  private

  def rental_params
    params.permit(:start_date, :end_date, :client_id, :car_category_id, :user_id)
  end
end

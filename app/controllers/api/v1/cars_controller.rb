class Api::V1::CarsController < Api::V1::ApiController
		def index
			@cars = Car.all
			render json: @cars
		end

	def show
		@car = Car.find(params[:id])
		render json: @car
	end

	# def create
	# 	@car = Car.create(car_params)
	# 	return render json: @car, status: :created if @car.save
	# end

	def status
		@car = Car.find(params[:id])
		return unless @car.update!(params.permit(:status))

		render json: @car.as_json(only: :status), status: :ok
	end


	private

	def car_params
		params.permit(:license_plate, :color, :car_model_id, :mileage, :subsidiary_id, :status)
	end
end

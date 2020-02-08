class ReportsController < ApplicationController

  def index
    @subsidiaries = Subsidiary.all
    @car_categories = CarCategory.all
    @car_models = CarModel.all
  end

  def results
    @start_date = params[:start_date]
    @end_date = params[:end_date]
    @type = params[:type]

    @subsidiary = params[:subsidiary]
    @category = params[:category]
    @model = params[:model]

    # if @type == 'subsidiary'
    #   @cars = Car.where(subsidiary_id: @subsidiary)
    # elsif @type == 'model'
    #   @cars = Car.where(car_model_id: @model)
    # else
    #   @cars = Car.joins(:car_model)
    #            .where(car_models: { car_category_id: @category })
    # end

    @cars = Car.where(subsidiary_id: @subsidiary)

    @rentals = Rental.where(start_date: @start_date..@end_date)
                     .or(Rental.where(end_date: @start_date..@end_date))

    @car_rentals = CarRental.where(rental: @rentals)
                            .where(car: @cars)

    respond_to do |format|
      format.html
      format.csv {
        send_data(@car_rentals.to_csv,
                  type: "text/csv",
                  filename: "relatorio-#{Date.current}.csv")
      }
    end
  end

end
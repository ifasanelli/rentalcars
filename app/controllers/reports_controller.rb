class ReportsController < ApplicationController
  def sub_reports
    @subsidiaries = Subsidiary.all
  end

  def cat_reports
    @car_categories = CarCategory.all
  end

  def mod_reports
    @car_models = CarModel.all
  end

  def sub_results
    @start_date = params[:start_date]
    @end_date = params[:end_date]
    @subsidiary = params[:subsidiary]
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
                  filename: "relatorio-filiais-#{@start_date}-to-#{@end_date}.csv")
      }
    end
  end

  def cat_results
    @start_date = params[:start_date]
    @end_date = params[:end_date]
    @category = params[:category]
    @cars = Car.joins(:car_model)
               .where(car_models: { car_category_id: @category })
    @rentals = Rental.where(start_date: @start_date..@end_date)
                     .or(Rental.where(end_date: @start_date..@end_date))
    @car_rentals = CarRental.where(rental: @rentals)
                            .where(car: @cars)
    respond_to do |format|
      format.html
      format.csv {
        send_data(@car_rentals.to_csv,
                  type: "text/csv",
                  filename: "relatorio-categorias-#{@start_date}-to-#{@end_date}.csv")
      }
    end
  end

  def mod_results
    @start_date = params[:start_date]
    @end_date = params[:end_date]
    @model = params[:model]
    @cars = Car.where(car_model_id: @model)
    @rentals = Rental.where(start_date: @start_date..@end_date)
                     .or(Rental.where(end_date: @start_date..@end_date))
    @car_rentals = CarRental.where(rental: @rentals)
                            .where(car: @cars)
    respond_to do |format|
      format.html
      format.csv {
        send_data(@car_rentals.to_csv,
                  type: "text/csv",
                  filename: "relatorio-modelos-#{@start_date}-to-#{@end_date}.csv")
      }
    end
  end

end

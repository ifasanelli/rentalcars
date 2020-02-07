class ReportsController < ApplicationController

  def index
    @car_rentals = CarRental.all
    @subsidiaries = Subsidiary.all

    respond_to do |format|
      format.html
      format.csv {
        send_data(@car_rentals.to_csv,
          type: "text/csv",
          filename: "relatorio-geral-#{Date.current}.csv")
      }
    end
  end

  def results
    @start_date = params[:start_date]
    @end_date = params[:end_date]
    @type = params[:type]

    @rentals = Rental.where(start_date: @start_date..@end_date)
                     .or(Rental.where(end_date: @start_date..@end_date))
    @car_rentals = CarRental.where(rental: @rentals)

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
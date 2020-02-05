class AddAccessoryToCarRental < ActiveRecord::Migration[5.2]
  def change
    add_reference :car_rentals, :accessory, foreign_key: true
  end
end

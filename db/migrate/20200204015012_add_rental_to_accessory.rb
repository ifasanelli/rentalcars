class AddRentalToAccessory < ActiveRecord::Migration[5.2]
  def change
    add_reference :accessories, :rental, foreign_key: true
  end
end

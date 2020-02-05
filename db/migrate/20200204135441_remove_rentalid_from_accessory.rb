class RemoveRentalidFromAccessory < ActiveRecord::Migration[5.2]
  def change
    remove_reference :accessories, :rental, index: true
  end
end

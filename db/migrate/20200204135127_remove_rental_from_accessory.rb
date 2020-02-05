class RemoveRentalFromAccessory < ActiveRecord::Migration[5.2]
  def change
    remove_column :accessories, :rental, :integer
  end
end

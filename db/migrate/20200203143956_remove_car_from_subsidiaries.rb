class RemoveCarFromSubsidiaries < ActiveRecord::Migration[5.2]
  def change
    remove_column :subsidiaries, :car_id, :integer
  end
end

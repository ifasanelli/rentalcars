class CreateAccessories < ActiveRecord::Migration[5.2]
  def change
    create_table :accessories do |t|
      t.string :name
      t.text :full_description
      t.decimal :price

      t.timestamps
    end
  end
end

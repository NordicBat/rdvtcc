class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :brand
      t.string :model
      t.integer :year
      t.string :licencePlate
      t.decimal :odometerActual

      t.timestamps null: false
    end
  end
end

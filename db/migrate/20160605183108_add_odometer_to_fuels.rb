class AddOdometerToFuels < ActiveRecord::Migration
  def change
    add_column :fuels, :odometer, :decimal
  end
end

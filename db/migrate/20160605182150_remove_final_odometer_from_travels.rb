class RemoveFinalOdometerFromTravels < ActiveRecord::Migration
  def change
    remove_column :travels, :finalOdometer, :decimal
  end
end

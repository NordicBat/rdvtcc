class RemoveFuelIdFromTravels < ActiveRecord::Migration
  def change
    remove_column :travels, :fuel_id, :integer
  end
end

class RemoveMealIdFromTravels < ActiveRecord::Migration
  def change
    remove_column :travels, :meal_id, :integer
  end
end
